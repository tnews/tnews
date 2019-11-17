part of tnews.main_app;

class MainAppScreen extends TStatelessWidget {
  final MainAppBloc bloc;

  MainAppScreen(this.bloc, {Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: bloc.lightTheme.getTheme(),
      darkTheme: bloc.darkTheme.getTheme(),
      themeMode: bloc.themeMode,
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
        '/': (_) => _buildHomePageScreen(),
      },
    );
  }

  Widget _buildHomePageScreen() {
    return HomePageScreen();
  }
}
