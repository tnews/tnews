part of tnews.news_detail;

class NewsDetailScreen extends StatefulWidget {
  static const String name = "/NewsDetailScreen";
  final String id;

  const NewsDetailScreen({@required this.id, Key key}) : super(key: key);

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final NewsDetailService service = DI.get(NewsDetailService);
  Future<XNews> news;
  @override
  void initState() {
    super.initState();
    news = service.getNews(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<XNews>(
      future: news,
      builder: (_, AsyncSnapshot<XNews> snapshot) {
        if (snapshot.hasData)
          return _buildXNews(snapshot.data);
        else {
          if (snapshot.hasError) {
            _registerCloseScreen();
          }

          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  Widget _buildXNews(XNews news) {
    return Scaffold(
      floatingActionButton: FloatFavoriteIcon(news),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        primary: true,
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: SliverHeaderNewsDetailDelegate(
              thumbnail: news.thumbnail,
              title: news.headline,
              onTapBack: _onTapBack,
            ),
            pinned: true,
            floating: false,
          ),
          SliverFillRemaining(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              itemCount: news.contents.length,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              itemBuilder: (_, int index) => Text(news.contents[index]),
              separatorBuilder: (_, __) => SizedBox(height: 25),
            ),
          ),
        ],
      ),
    );
  }

  void _registerCloseScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pop<ResultPop>(ResultPop.Failure);
    });
  }

  void _onTapBack() {
    Navigator.of(context).pop<ResultPop>(ResultPop.Success);
  }
}

enum ResultPop {
  Success,
  Failure,
}
