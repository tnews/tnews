part of tnews.history;

class HistoryScreen extends StatelessWidget {
  final HistoryService historyService = DI.get(HistoryService);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAVORITE NEWS")),
      body: FutureBuilder<List<XNews>>(
        future: historyService.getAllNews(),
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
