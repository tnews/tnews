part of tnews.common.widgets;

abstract class TWidget {
  static Future<T> navigateToScreen<T>({@required BuildContext context, @required Widget screen, String name}) {
    final RouteSettings settings = name is String ? RouteSettings(name: name) : null;

    return Navigator.of(context).push<T>(
      TPageRoute<T>(
        builder: (BuildContext context) => screen,
        settings: settings,
      ),
    );
  }
}

abstract class TStatefulWidget extends StatefulWidget with TWidget {}
