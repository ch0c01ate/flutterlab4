import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterLibraryBloc extends Bloc<CounterEvent, CounterState> {
  CounterLibraryBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is CounterIncrementEvent) {
      yield CounterState(state.counter + 1);
    } else if (event is CounterDecrementEvent) {
      yield CounterState(state.counter - 1);
    }
  }
}

class CounterEvent extends Equatable {
  CounterEvent();

  factory CounterEvent.increment() = CounterIncrementEvent;
  factory CounterEvent.decrement() = CounterDecrementEvent;

  @override
  List<Object> get props => [];
}

class CounterIncrementEvent extends CounterEvent {}

class CounterDecrementEvent extends CounterEvent {}

class CounterState extends Equatable {
  final int counter;
  CounterState(this.counter);

  @override
  List<Object> get props => [counter];
}
