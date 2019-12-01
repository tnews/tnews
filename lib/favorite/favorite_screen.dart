part of tnews.favorite;

class FavoriteScreen extends TStatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends TState<FavoriteScreen> {
  final FavoriteService favoriteService = DI.get(FavoriteService);
  Future<List<XNews>> news;
  @override
  void initState() {
    super.initState();
    news = favoriteService.getAllFavoriteNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAVORITE NEWS")),
      body: FutureBuilder<List<XNews>>(
        future: news,
        builder: (_, AsyncSnapshot<List<XNews>> snapshot) {
          if (snapshot.hasData) {
            return _buildListFavorite(snapshot.data);
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildListFavorite(List<XNews> news) {
    return ListView.builder(
      primary: false,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemExtent: 120,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, int i) => NewsItemWidget(news[i]),
      itemCount: news.length,
    );
  }
}
