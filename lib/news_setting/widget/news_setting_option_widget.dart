part of tnews.news_setting.widget;

class NewsSettingOptionWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Widget leading;
  final Widget trailing;

  NewsSettingOptionWidget.custom(
      {@required this.leading, @required this.trailing, Key key, this.onTap})
      : super(key: key);

  NewsSettingOptionWidget(
      {@required String title, @required String trailingText, Key key, this.onTap})
      : leading = Text(title, style: TTextStyles.bold(fontSize: 16)),
        trailing = Text(
          trailingText,
          style: TTextStyles.normal(fontSize: 16, color: TColors.deepSkyBlue),
        ),
        super(key: key);

  NewsSettingOptionWidget.customTrailing(
      {@required String title, @required this.trailing, Key key, this.onTap})
      : leading = Text(title, style: TTextStyles.semi(fontSize: 16)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: leading,
        trailing: trailing,
      ),
    );
  }
}
