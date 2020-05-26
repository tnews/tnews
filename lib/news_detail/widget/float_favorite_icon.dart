part of tnews.news_detail.widget;

class FloatFavoriteIcon extends StatefulWidget {
  final XNews news;

  const FloatFavoriteIcon(this.news, {Key key}) : super(key: key);

  @override
  _FloatFavoriteIconState createState() => _FloatFavoriteIconState();
}

class _FloatFavoriteIconState extends State<FloatFavoriteIcon> {
  final FavoriteService service = DI.get<FavoriteService>(FavoriteService);
  bool isFavorite = false;
  XNews get news => widget.news;

  void initState() {
    super.initState();
    service.isFavorite(news.id).then((bool values) {
      Logger.debug('------------------------ $values');
      if (isFavorite != values) {
        setState(() {
          isFavorite = values;
        });
      }
    }).catchError((dynamic ex) => Logger.error(ex));
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Icon icon = Icon(isFavorite ? Icons.favorite : Icons.favorite_border);
    return FloatingActionButton(
      child: icon,
      onPressed: _onPress,
      backgroundColor: theme.primaryColor,
    );
  }

  void _onPress() {
    Logger.debug('On press $isFavorite');
    if (!isFavorite) {
      service.add(news);
    } else {
      service.delete(news.id);
    }

    setState(() {
      isFavorite = !isFavorite;
    });
  }
}
