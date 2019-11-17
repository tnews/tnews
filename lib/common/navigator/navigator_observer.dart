part of tnews.common.navigator;

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
