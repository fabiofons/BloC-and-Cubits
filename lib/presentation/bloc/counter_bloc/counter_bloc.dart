import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncreased>(_onCounterIncreased);
    // on<CounterReset>(_onResetCounter);
    on<CounterReset>(_onResetCounter);

  }

  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCounter: state.transactionCounter + 1));
  }
  
  void _onResetCounter(CounterReset event, Emitter<CounterState> emit){
    emit(state.copyWith(
      counter: 0 
    ));
  }
}
