part of tnews.news_feed;

class NewsFeedScreen extends TStatelessWidget {
  final NewsService service = DI.get(NewsService);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsFeedAppBar(),
      body: FutureBuilder<List<XNews>>(
        future: service.searchXNews(),
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
      physics: const BouncingScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (_, int index) => NewsItemWidget(data[index]),
    );
  }
}
