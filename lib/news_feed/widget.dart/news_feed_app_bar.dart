part of tnews.news_feed.widget;

class NewsFeedAppBar extends TAppBar implements PreferredSizeWidget {
  final VoidCallback onTapSearch;
  final VoidCallback onTapSetting;

  const NewsFeedAppBar({this.onTapSearch, this.onTapSetting, Key key})
      : super(key: key, preferredSize: const Size.fromHeight(44));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(Assets.imageAsset), //Logo
          Spacer(),
          TCircleIcon(child: Icon(Icons.search)), //Icon Search
          SizedBox(width: 7),
          TCircleIcon(child: Icon(Icons.settings)), //Icon Search
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
