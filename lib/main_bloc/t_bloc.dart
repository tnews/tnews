part of tnews.main_bloc;

abstract class TBloc<Event extends BaseEvent, State extends BaseState>
    extends BaseBloc<Event, State> {
  @protected
  Duration get delayEvent;

  @override
  Stream<Transition<Event, State>> transformEvents(    
    Stream<Event> events,
    TransitionFunction<Event, State> transitionFn,
    ) {
    return events.debounceTime(delayEvent).switchMap(transitionFn);
  }

  @protected
  void add(Event event) => super.add(event);
}

abstract class BaseBloc<Event extends BaseEvent, State extends BaseState>
    extends Bloc<Event, State> {
  Stream<State> mapEventToState(Event event) {
    if (event is BaseErrorEvent) {
      Logger.debug('event ${event.runtimeType}');
      final Stream<State> baseState = errorToState(event);
      return baseState;
    } else {
      return eventToState(event);
    }
  }

  Stream<State> errorToState(BaseErrorEvent event);

  Stream<State> eventToState(BaseEvent event);

  void notifyError(BaseErrorEvent event) {
    final BaseEvent baseEvent = event;
    add(baseEvent);
  }
}

@immutable
abstract class BaseEvent {
  @override
  String toString() => '$runtimeType';
}

@immutable
abstract class BaseState {
  @override
  String toString() => '$runtimeType';
}

abstract class BaseErrorEvent extends BaseEvent {
  final String message;

  BaseErrorEvent(this.message);

  @override
  String toString() => '$runtimeType $message';
}

abstract class BaseErrorState extends BaseState {
  final String message;

  BaseErrorState(this.message);

  @override
  String toString() => '$runtimeType $message';
}
