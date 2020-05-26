part of tnews.news_setting;

class NewsSettingScreen extends StatelessWidget {
  static String name = '/NewsSettingScreen';

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
            Flexible(flex: 5, child: _buildItemSetting(context))
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

  Widget _buildLanguage() {
    return Opacity(
      opacity: 0.2,
      child: NewsSettingOptionWidget(title: 'Ngôn ngữ của báo', trailingText: 'Tiếng việt'),
    );
  }

  Widget _buildItemSetting(BuildContext context) {
    final Widget language = _buildLanguage();
    final Widget notify = _buildSoundEffectSetting(context);
    final Widget report = _buildReport(context);
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          language,
          notify,
          report,
          Divider(color: theme.primaryColor),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: _navigateToLink,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Copyright belongs to ',
                        style: TTextStyles.black(color: TColors.black10),
                      ),
                      TextSpan(
                        text: 'tvc12',
                        style: TTextStyles.black().copyWith(
                          decoration: TextDecoration.underline,
                          color: TColors.deepSkyBlue.withAlpha(128),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSoundEffectSetting(BuildContext context) {
    final String title = 'Thông báo';
    return Opacity(
      opacity: 1,
      child: NewsSettingOptionWidget.customTrailing(
        title: title,
        trailing: Switch(
          onChanged: _onSoundEffectChanged,
          activeColor: Theme.of(context).primaryColor,
          value: true,
          dragStartBehavior: DragStartBehavior.start,
        ),
        // onTap: _onTapSoundEffectButton,
      ),
    );
  }

  Widget _buildReport(BuildContext context) {
    return NewsSettingOptionWidget.customTrailing(
      title: 'Báo cáo bài báo',
      trailing: Icon(Icons.report),
    );
  }

  void _navigateToLink() {
    final String url = 'https://github.com/tvc12';
    canLaunch(url)
        .then((bool isLaunch) => isLaunch ? launch(url) : throw Exception('Can\'t launch $url'))
        .catchError((dynamic ex) => Logger.error(ex));
  }

  void _onSoundEffectChanged(bool value) {}
}
