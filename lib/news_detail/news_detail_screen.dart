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
    return Scaffold();
  }

  void _registerCloseScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pop<ResultPop>(ResultPop.Failure);
    });
  }
}

enum ResultPop {
  Success,
  Failure,
}
