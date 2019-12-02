part of tnews.favorite;

class FavoriteScreen extends TStatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends TState<FavoriteScreen> {
  final FavoriteService favoriteService = DI.get(FavoriteService);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAVORITE NEWS")),
      body: FutureBuilder<List<XNews>>(
        future: favoriteService.getAllFavoriteNews(),
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
      itemBuilder: (_, int i) => NewsItemWidget(news[i], onTap: _onTapNews),
      itemCount: news.length,
    );
  }

  void _onTapNews(String id) {
    TWidget.navigateToScreen<ResultPop>(
      screen: NewsDetailScreen(id: id),
      name: NewsDetailScreen.name,
      context: context,
    ).then((ResultPop result) {
      if (result == ResultPop.Failure) {
        TWidget.showError(context: context, message: "Báo bạn đọc bị lỗi, mời thử lại!");
      }
    }).catchError((_) {
      Log.error(_);
      TWidget.showError(context: context, message: "Báo bạn đọc bị lỗi, mời thử lại!");
    });
  }
}
