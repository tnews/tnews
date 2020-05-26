part of tnews.main_bloc;

abstract class MainBlocEvent extends BaseEvent {
  @override
  String toString() => 'MainBlocEvent';
}

class InitAppEvent extends MainBlocEvent {
  @override
  String toString() => 'InitAppEvent';
}

class ReloadAppEvent extends MainBlocEvent {
  @override
  String toString() => 'ReloadAppEvent';
}

class ActiveAppEvent extends MainBlocEvent {
  @override
  String toString() => 'ActiveAppEvent';
}

class DeActiveAppEvent extends MainBlocEvent {
  @override
  String toString() => 'DeActiveAppEvent';
}
