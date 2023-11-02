import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_checker/blocs/internet_bloc/internet_bloc.dart';
import 'package:internet_checker/blocs/internet_bloc/internet_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet Checker'),
      ),
      body: Center(
        child: BlocConsumer<InternetBloc, InternetStates>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("Internet Connected"),
                  backgroundColor: Colors.green.shade700,
                ),
              );
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Internet Lost!!'),
                  backgroundColor: Colors.red.shade700,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text(
                'Internet Connected',
                style: TextStyle(
                  fontSize: 26,
                ),
              );
            } else if (state is InternetLostState) {
              return const Text(
                'Internet Lost!!',
                style: TextStyle(
                  fontSize: 26,
                ),
              );
            } else {
              return const Text(
                'Loading',
                style: TextStyle(
                  fontSize: 26,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
