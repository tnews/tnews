part of tnews.news_feed;

class NewsFeedScreen extends TStatelessWidget {
  static NewsService service = DI.get(NewsService);
  final Future<List<XNews>> news = service.searchXNews();
  final Future<List<Category>> categories = service.getCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsFeedAppBar(),
      body: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: FutureBuilder<List<Category>>(
              future: categories,
              builder: (_, AsyncSnapshot<List<Category>> snapshot) {
                if (snapshot.hasData) {
                  return CategoryBarWidget(
                    categories: snapshot.data,
                  );
                } else
                  return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Flexible(
            flex: 15,
            child: FutureBuilder<List<XNews>>(
              future: news,
              builder: (_, AsyncSnapshot<List<XNews>> snapshot) {
                if (snapshot.hasData) {
                  return _buildListingNews(snapshot.data);
                } else
                  return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListingNews(List<XNews> data) {
    return ListView.builder(
      primary: false,
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
