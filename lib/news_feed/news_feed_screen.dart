part of tnews.news_feed;

class NewsFeedScreen extends TStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
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
      ),
      body: Container(),
    );
  }
}
