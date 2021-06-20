import 'dart:async';

import 'package:rxdart/subjects.dart';

abstract class BaseBloc<Event, PageState> {
  final BehaviorSubject<PageState> _pageStateSubject =
      BehaviorSubject<PageState>();
  final StreamController<Event> _eventsController = StreamController<Event>();
  final List<StreamSubscription> _subscriptions = List<StreamSubscription>();

  BehaviorSubject<PageState> get stateSubject => _pageStateSubject;
  StreamController<Event> get eventStream => _eventsController;
  List<StreamSubscription> get subscriptions => _subscriptions;

  void dispose() {
    _subscriptions.forEach((subscription) => subscription.cancel());
    _pageStateSubject.close();
    _eventsController.close();
  }
}

abstract class Event {}

abstract class PageState {}
