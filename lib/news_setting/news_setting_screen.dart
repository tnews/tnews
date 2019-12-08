part of tnews.news_setting;

class NewsSettingScreen extends StatelessWidget {
  static String name = "/NewsSettingScreen";

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Widget logo = _buildLogo();
    return Scaffold(
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              color: theme.primaryColor,
              icon: Icon(Icons.arrow_back),
              onPressed: () => _onTapBack(context),
            ),
            Flexible(flex: 2, child: logo),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 150,
        child: Image.asset(Assets.imageAsset),
      ),
    );
  }

  void _onTapBack(BuildContext context) {
    Navigator.of(context).pop<ResultPop>(ResultPop.ReloadScreen);
  }
}
