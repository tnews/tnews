part of tnews.news_feed.widget;

abstract class XBaseNews extends StatelessWidget {
  final XNews news;
  const XBaseNews(this.news, {Key key}) : super(key: key);
}

class NewsItemWidget extends XBaseNews {
  final ValueChanged<String> onTap;
  NewsItemWidget(XNews news, {Key key, this.onTap}) : super(news, key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: _onTap,
      child: Container(
        height: 96,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(child: _buildImage(this.news.thumbnail)),
            Expanded(flex: 2, child: _buildContent(theme)),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String url) {
    final double height = 90;
    final double width = 115;
    return TCacheImageWidget(
      width: width,
      height: height,
      url: url,
    );
  }

  Widget _buildContent(ThemeData theme) {
    final String title = StringConverter.toPascalCase(news.headline) ?? '';
    final String firstCategory = news.categories?.isNotEmpty == true ? news.categories.first : null;
    final String category = StringConverter.toPascalCase(firstCategory) ?? '';

    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(title, theme),
          SizedBox(height: 3),
          Flexible(
            child: _buildCreator(category, news.source ?? '', news.url ?? '', theme),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String title, ThemeData theme) {
    return Text(
      title,
      style: theme.textTheme.title.copyWith(
        fontWeight: FontWeight.w900,
        color: theme.accentColor,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildCreator(String category, String source, String url, ThemeData theme) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          category,
          style: theme.textTheme.subtitle,
          maxLines: 1,
        ),
        Text(" • ", style: theme.textTheme.subtitle),
        Text(
          source,
          style: theme.textTheme.subtitle.copyWith(
            color: theme.primaryColor.withOpacity(0.8),
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
          ),
          maxLines: 1,
        )
      ],
    );
  }

  void _onTap() {
    if (onTap != null) onTap(news.id);
  }
}
