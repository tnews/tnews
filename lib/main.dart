import 'dart:async';

import 'package:ddi/ddi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tnews/common/common.dart';
import 'package:tnews/main_bloc/bloc_delegate.dart';
import 'package:tnews/main_bloc/main_bloc.dart';
import 'package:tnews/module/module.dart';
import 'package:tnews_core/tnews_core.dart';
import 'package:bloc/bloc.dart';

void main() {
  final MainAppBloc bloc = MainAppBloc();

  Log.debug('this is main');

  handleError();
  runZoned(() {
    runApp(buildApp(bloc));
  }, onError: (dynamic ex, dynamic trace) {
    // Crashlytics.instance.recordError(ex, trace);
  });
  // Future.delayed(const Duration(seconds: 5)).then((_) {
  //   bloc.dispatch(InitMainAppEvent());
  // });
}

void initAsync(MainAppBloc bloc) async {
  Log.debug('this is initAsync');
  // await Future.delayed(const Duration(seconds: 5));
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

  Config.initAsync(mode)
      .then((_) => DI.initAsync(modules))
      .catchError((dynamic ex) => Log.error(ex))
      .whenComplete(() => bloc.add(ActiveAppEvent()));
  // .then((_) => bloc.dispatch(CompletedInitMainAppEvent()));
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

Widget buildApp(MainAppBloc bloc) {
  final Widget child = blocBuilder(buildMainApp(), bloc);
  return MaterialApp(
    home: BlocProvider<MainAppBloc>(
      builder: (_) => bloc,
      child: child,
    ),
  );
}

Widget blocBuilder(Widget child, MainAppBloc bloc) {
  return BlocBuilder<MainAppBloc, MainBlocState>(
    bloc: bloc,
    builder: (_, MainBlocState state) {
      Log.debug('bloc_Bulder $state');
      switch (state.runtimeType) {
        case CreatedApp:
          return buildSplashScreen();
          break;
        case ActiveApp:
          return child;
        default:
          return child;
      }
    },
  );
}

Widget buildSplashScreen() {
  return Scaffold(
    backgroundColor: TColors.white,
    body: Center(
      child: Image.network('https://github.com/tvc12.png'),
      // child: Text(
      //   'Slash Screen',
      //   style: TTextStyles.bold(
      //     fontSize: 150,
      //     color: TColors.green,
      //   ),
      // ),
    ),
  );
}

Widget buildMainApp() {
  return Scaffold(
    backgroundColor: TColors.white,
    body: Center(
      child: Text(
        'Main Screen',
        style: TTextStyles.bold(
          fontSize: 150,
          color: TColors.black,
        ),
      ),
    ),
  );
}
