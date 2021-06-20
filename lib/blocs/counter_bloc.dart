import 'package:blocdemo/utils/base_bloc.dart';

class CounterBloc extends BaseBloc<CounterEvent, CounterDataState> {
  CounterBloc() {
    stateSubject.add((CounterDataState(0)));
    _subscribeOnEvents();
  }

  void _subscribeOnEvents() {
    subscriptions.add(eventStream.stream.listen((event) {
      if (event is CounterIncrementEvent) {
        stateSubject
            .add(CounterDataState((stateSubject.value?.counter ?? 0) + 1));
      } else if (event is CounterDecrementEvent) {
        stateSubject
            .add(CounterDataState((stateSubject.value?.counter ?? 0) - 1));
      }
    }));
  }
}

class CounterEvent extends Event {
  CounterEvent();

  factory CounterEvent.increment() = CounterIncrementEvent;
  factory CounterEvent.decrement() = CounterDecrementEvent;
}

class CounterIncrementEvent extends CounterEvent {}

class CounterDecrementEvent extends CounterEvent {}

class CounterDataState extends PageState {
  final int counter;
  CounterDataState(this.counter);
}
