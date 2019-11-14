library tnews.main_bloc;

import 'package:bloc/bloc.dart';

part 'main_bloc_event.dart';
part 'main_bloc_state.dart';

class MainAppBloc extends Bloc<MainBlocEvent, MainBlocState> {
  @override
  MainBlocState get initialState => CreatedApp();

  @override
  Stream<MainBlocState> mapEventToState(MainBlocEvent event) {
    return null;
  }
}
