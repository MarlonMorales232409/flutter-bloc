import 'package:blocs_app/presentation/blocs/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});


  @override
  Widget build(BuildContext context) {
  final bHistoryLocation = context.watch<HistoryLocationBloc>();
  final historyLocationState = bHistoryLocation.state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Location Number ${historyLocationState.howManyLocations}'),
      ),
      body: ListView.builder(
        itemCount: historyLocationState.howManyLocations,
        itemBuilder: (BuildContext context, int index) {
            final location = historyLocationState.locations[index];

            final ( lat, lng ) = location;

            return ListTile(
              title: Text('Lat: $lat, Lng: $lng'),
            );
          }
        )
    );
  }
}