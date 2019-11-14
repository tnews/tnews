library tnews.main_bloc;

import 'package:bloc/bloc.dart';

part 'main_bloc_event.dart';
part 'main_bloc_state.dart';

class MainAppBloc extends Bloc<MainBlocEvent, MainBlocState> {
  final Map<Type, MainBlocState> mapToState = <Type, MainBlocState>{
    InitAppEvent: InitApp(),
    ActiveAppEvent: ActiveApp(),
    DeActiveAppEvent: DeActiveApp(),
    ReloadAppEvent: ReloadApp(),
  };
  @override
  MainBlocState get initialState => CreatedApp();

  @override
  Stream<MainBlocState> mapEventToState(MainBlocEvent event) async* {
    yield mapToState[event.runtimeType];
  }
}
