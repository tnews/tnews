import 'package:bloc/bloc.dart';
import 'package:tnews_core/util/logger.dart';

class TNewsBlocDelegate extends BlocDelegate {
  @override
  void onEvent(final Bloc<dynamic, dynamic> bloc, Object event) {
    super.onEvent(bloc, event);
    Logger.debug('${bloc.runtimeType}: $event');
  }

  @override
  void onTransition(final Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    Logger.debug('${bloc.runtimeType}: $transition');
  }

  @override
  void onError(final Bloc<dynamic, dynamic> bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    Logger.debug(error);
    Logger.debug(stacktrace);
  }
}
