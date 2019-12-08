import 'dart:async';

import 'package:ddi/ddi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tnews/main_app/main_app.dart';
import 'package:tnews/main_bloc/bloc_delegate.dart';
import 'package:tnews/main_bloc/main_bloc.dart';
import 'package:tnews/module/module.dart';
import 'package:tnews/splash/splash.dart';
import 'package:tnews_core/tnews_core.dart';
import 'package:bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  handleError();
  final MainAppBloc bloc = MainAppBloc();
  initAsync(bloc);
  runZoned(() {
    runApp(buildMainApp(bloc));
  }, onError: (dynamic ex, dynamic trace) {
    Logger.error("Crash app $ex - $trace");
  });
}

Future<void> initAsync(MainAppBloc bloc) async {
  final Mode mode = kReleaseMode ? Mode.Production : Mode.Debug;
  final List<Module> modules = kReleaseMode
      ? <Module>[
          ProdModule(),
          ProdModuleCore(),
        ]
      : <Module>[
          DevModule(),
          DevModuleCore(),
        ];

  return Config.initAsync(mode)
      .then((_) => DI.initAsync(modules))
      .then(
        (_) => Future<void>.delayed(const Duration(milliseconds: 150)).then(
          (_) => bloc.runApp(),
        ),
      )
      .catchError((dynamic ex) => Logger.error(ex));
}

void handleError() {
  FlutterError.onError = (FlutterErrorDetails error) {
    FlutterError.dumpErrorToConsole(error);
    Zone.current.handleUncaughtError(error.exception, error.stack);
  };
  if (!kReleaseMode) {
    BlocSupervisor.delegate = TNewsBlocDelegate();
  }
}

Widget buildMainApp(MainAppBloc bloc) {
  return BlocBuilder<MainAppBloc, MainBlocState>(
    bloc: bloc,
    builder: (_, MainBlocState state) {
      Logger.debug("current state $state");
      switch (state.runtimeType) {
        case CreatedApp:
        case InitApp:
          return const SplashScreen();
          break;
        case ActiveApp:
          return MainAppScreen(bloc);
        default:
          return const SplashScreen();
      }
    },
  );
}
