part of tnews.home_page;

class HomePageScreen extends TStatelessWidget {
  final List<BottomBarItemWidget> tabIcons = <BottomBarItemWidget>[
    BottomBarItemWidget(Icons.home),
    BottomBarItemWidget(Icons.rss_feed),
    BottomBarItemWidget(Icons.favorite)
  ];
  @override
  Widget build(BuildContext context) {
    return BottomBarWidget(
      children: <Widget>[
        NewsFeedScreen(),
        FollowScreen(),
        FavoriteScreen(),
      ],
      iconBulder: (BuildContext context, int index, bool isSelected) {
        return isSelected
            ? tabIcons[index].buildSeletect(context)
            : tabIcons[index].buildUnSelect(context);
      },
    );
  }
}
