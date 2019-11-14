part of tnews.module;

class DevModule extends AbstractModule {
  @override
  void init() {
    bind(MainAppBloc).to(MainAppBloc());
  }
}
