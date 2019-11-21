part of tnews.news_feed;

class NewsFeedScreen extends TStatelessWidget {
  static NewsService service = DI.get(NewsService);
  final Future<List<XNews>> news = service.searchXNews();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsFeedAppBar(),
      body: FutureBuilder<List<XNews>>(
        future: news,
        builder: (_, AsyncSnapshot<List<XNews>> snapshot) {
          if (snapshot.hasData) {
            return _buildListingNews(snapshot.data);
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildListingNews(List<XNews> data) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemExtent: 120,
      physics: const BouncingScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (_, int index) => NewsItemWidget(
        data[index],
        onTap: _onTapNews,
      ),
    );
  }

  void _onTapNews(String value) {}
}
