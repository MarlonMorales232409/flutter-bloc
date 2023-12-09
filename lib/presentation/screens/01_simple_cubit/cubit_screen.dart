import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final cUsername = context.watch<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
        child: BlocBuilder<UsernameCubit, String>(
          builder: (context, state) {
            return Text(state);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => cUsername.setUsername(RandomGenerator.getRandomName()),
        onPressed: () => context.read<UsernameCubit>().setUsername(RandomGenerator.getRandomName()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
