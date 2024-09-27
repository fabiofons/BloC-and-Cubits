import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/bloc/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {

    final cubitCounterState = context.watch<CounterCubit>().state;

    return Scaffold(
        appBar: AppBar(
          title: Text('Cubit Counter: ${cubitCounterState.transactionCount}'),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.refresh_rounded))
          ],
        ),
        body: Center(
          child: BlocBuilder<CounterCubit, CounterState>(
            // buildWhen: (previous, current) => previous.counter != current.counter,
            builder: (context, state) {
              return Text('Counter Clicks: ${state.counter}');
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: '3',
              onPressed: () {},
              child: const Text('+3'),
            ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () {},
              child: const Text('+2'),
            ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
              heroTag: '1',
              onPressed: () {},
              child: const Text('+1'),
            ),
          ],
        ));
  }
}
