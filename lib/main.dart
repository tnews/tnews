import 'dart:async';

import 'package:ddi/ddi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tnews/home_page/home_page.dart';
import 'package:tnews/main_bloc/bloc_delegate.dart';
import 'package:tnews/main_bloc/main_bloc.dart';
import 'package:tnews/module/module.dart';
import 'package:tnews/splash/splash.dart';
import 'package:tnews_core/tnews_core.dart';
import 'package:bloc/bloc.dart';

void main() async {
  handleError();
  await initAsync();
  final MainAppBloc bloc = DI.get(MainAppBloc);

  runZoned(() {
    runApp(buildApp(bloc));
    Future<void>.delayed(const Duration(seconds: 1)).whenComplete(() {
      bloc.add(ActiveAppEvent());
    });
  }, onError: (dynamic ex, dynamic trace) {
    Log.error("Crash app $ex - $trace");
  });
}

Future<void> initAsync() async {
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

  return Config.initAsync(mode).then((_) => DI.initAsync(modules)).catchError((dynamic ex) => Log.error(ex));
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

class TNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    Log.debug("$runtimeType didPush $route $previousRoute");
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    Log.debug("$runtimeType didPop $route $previousRoute");
    super.didPop(route, previousRoute);
  }
}

Widget buildApp(MainAppBloc bloc) {
  final Widget mainApp = buildMainApp(bloc);
  return MaterialApp(
    navigatorObservers: <NavigatorObserver>[TNavigatorObserver()],
    onGenerateRoute: (RouteSettings route) {
      Log.info("onGenerateRoute $route");
      return null;
    },
    onUnknownRoute: (RouteSettings route) {
      Log.info("onUnknownRoute $route");
      return null;
    },
    routes: <String, WidgetBuilder>{
      '/': (_) => mainApp,
      // ''
    },
  );
}

Widget buildMainApp(MainAppBloc bloc) {
  final Widget child = HomePageScreen();

  return BlocBuilder<MainAppBloc, MainBlocState>(
    bloc: bloc,
    builder: (_, MainBlocState state) {
      switch (state.runtimeType) {
        case CreatedApp:
        case InitApp:
          return const SplashScreen();
          break;
        case ActiveApp:
          return child;
        default:
          return child;
      }
    },
  );
}
