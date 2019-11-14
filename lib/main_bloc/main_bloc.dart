library tnews.main_bloc;

import 'package:bloc/bloc.dart';

part 'main_bloc_event.dart';
part 'main_bloc_state.dart';

class MainBloc extends Bloc<MainBlocEvent, MainBlocState> {
  @override
  MainBlocState get initialState => CreatedApp();

  @override
  Stream<MainBlocState> mapEventToState(MainBlocEvent event) {
    return null;
  }
}
