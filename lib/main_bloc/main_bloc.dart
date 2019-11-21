library tnews.main_bloc;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tnews/common/theme/theme.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tnews_core/util/log.dart';

part 'main_bloc_event.dart';
part 'main_bloc_state.dart';
part 't_bloc.dart';

class MainAppBloc extends TBloc<MainBlocEvent, MainBlocState> {
  final Map<Type, MainBlocState> mapToState = <Type, MainBlocState>{
    InitAppEvent: InitApp(),
    ActiveAppEvent: ActiveApp(),
    DeActiveAppEvent: DeActiveApp(),
    ReloadAppEvent: ReloadApp(),
  };
  final TNewsTheme darkTheme = TNewsDarkTheme();
  final TNewsLightTheme lightTheme = TNewsLightTheme();
  ThemeMode themeMode = ThemeMode.light;

  @override
  MainBlocState get initialState => CreatedApp();

  @override
  Duration get delayEvent => const Duration(milliseconds: 50);

  @override
  Stream<MainBlocState> errorToState(BaseErrorEvent event) {
    return null;
  }

  @override
  Stream<MainBlocState> eventToState(BaseEvent event) async* {
    Log.debug("event ${event.runtimeType}");
    yield mapToState[event.runtimeType];
  }

  void runApp() {
    add(ActiveAppEvent());
  }
}
