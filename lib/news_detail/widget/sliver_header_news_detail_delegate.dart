part of tnews.news_detail.widget;

class SliverHeaderNewsDetailDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String title;
  final VoidCallback onTapBack;

  final String thumbnail;
  SliverHeaderNewsDetailDelegate({
    @required this.thumbnail,
    @required this.title,
    this.onTapBack,
    this.expandedHeight = 250,
  });
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double appBarHeight = expandedHeight - shrinkOffset;
    final double percen = _getPercent(appBarHeight, expandedHeight);
    final ThemeData theme = Theme.of(context);

    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: <Widget>[
        TCacheImageWidget(url: thumbnail),
        Opacity(
          opacity: 1 - percen,
          child: AppBar(
            title: Text(title),
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: _onTap,
              child: Icon(
                Icons.arrow_back,
                size: 24,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        Opacity(
          opacity: percen,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(boxShadow: TShadows.defaultShadow),
            child: Text(
              title,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).accentTextTheme.title,
            ),
          ),
        ),
        Opacity(
          opacity: percen,
          child: SafeArea(
            child: Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: _onTap,
                icon: Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;
  double get minExtent => kToolbarHeight + kToolbarHeight / 3;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  double _getPropotion(double appBarHeight, double expandedHeight) {
    return 2 - (expandedHeight / appBarHeight);
  }

  double _getPercent(double appBarHeight, double expandedHeight) {
    final double proportion = _getPropotion(appBarHeight, expandedHeight);
    return proportion < 0 || proportion > 1 ? 0.0 : proportion;
  }

  void _onTap() {
    if (onTapBack != null) onTapBack();
  }
}
