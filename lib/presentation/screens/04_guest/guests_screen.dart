import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GuestsScreen extends StatelessWidget {
  const GuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc - GuestBloc'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: () => context.read<GuestsBloc>().addNewGuest(RandomGenerator.getRandomName()),
      ),
    );
  }
}


class _TodoView extends StatelessWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context) {

    final bGuest = context.watch<GuestsBloc>();
    final currentFilter = bGuest.state.guestFilter;

    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

        SegmentedButton(
          segments: const[
            ButtonSegment(value: GuestFilter.all, icon: Text('Todos')),
            ButtonSegment(value: GuestFilter.invited, icon: Text('Invitados')),
            ButtonSegment(value: GuestFilter.notInvited, icon: Text('No invitados')),
          ], 
          selected: <GuestFilter>{ currentFilter },
          onSelectionChanged: (Set<GuestFilter> value) => bGuest.changeFilter(value.first),
        ),
        const SizedBox( height: 5 ),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: bGuest.state.howManyGuestFiltered,
            itemBuilder: (context, index) {
              final guest = bGuest.state.getFilteredGuest[index];
              return SwitchListTile(
                title: Text( guest.description ),
                value: guest.done, 
                onChanged: ( value ) => bGuest.toggleGuest(guest.id)
              );
            },
          ),
        )
      ],
    );
  }
}