import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 9));

  void increaseBy( int value) {
    emit( state.copyWith(
      counter: state.counter + value,
      transactionCount: state.transactionCount + 1
    ));
  }

  void resetCounter() {
    emit( state.copyWith(
      counter: 0
    ) );
  }
}
