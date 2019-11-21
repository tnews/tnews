part of tnews.main_bloc;

enum AppStatus {
  Created, // created
  Init, // init app
  Active, // active
  Reload,
  DeActive, // app deactive
}

abstract class MainBlocState extends BaseState {
  static AppStatus statusApp = AppStatus.Created;

  MainBlocState(AppStatus statusApp) {
    statusApp = statusApp ?? AppStatus.Created;
  }
}

class CreatedApp extends MainBlocState {
  CreatedApp() : super(AppStatus.Created);

  @override
  String toString() => "CreatedApp";
}

class InitApp extends MainBlocState {
  InitApp() : super(AppStatus.Init);

  @override
  String toString() => "InitApp";
}

class ActiveApp extends MainBlocState {
  ActiveApp() : super(AppStatus.Active);

  @override
  String toString() => 'AppStatus';
}

class ReloadApp extends MainBlocState {
  ReloadApp() : super(AppStatus.Reload);
  @override
  String toString() => "AppStatus";
}

class DeActiveApp extends MainBlocState {
  DeActiveApp() : super(AppStatus.DeActive);

  @override
  String toString() => "DeActiveApp";
}
