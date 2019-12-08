part of tnews.news_feed;

class NewsFeedScreen extends TStatefulWidget {
  static NewsService service = DI.get(NewsService);

  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends TState<NewsFeedScreen> {
  final Future<List<XNews>> news = NewsFeedScreen.service.searchXNews();

  final Future<List<Category>> categories = NewsFeedScreen.service.getCategories();
  double height = 0;
  List<Category> data;

  @override
  void initState() {
    super.initState();
    categories.then((_) {
      setState(() {
        data = _;
        height = 32;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsFeedAppBar(),
      body: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AnimatedContainer(
            height: height,
            duration: const Duration(milliseconds: 150),
            child: height != 0 ? CategoryBarWidget(categories: data) : SizedBox(),
          ),
          Flexible(
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
      Logger.error(_);
      TWidget.showError(context: context, message: "Báo bạn đọc bị lỗi, mời thử lại!");
    });
  }
}
