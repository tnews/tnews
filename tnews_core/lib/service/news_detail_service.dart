part of t_core.service;

abstract class NewsDetailService {
  Future<XNews> getNews(String id);
}

abstract class CachedNewsDetailService extends NewsDetailService {
  final Map<String, XNews> cached = <String, XNews>{};

  Future<List<XNews>> getListCachedNews();
}

class CachedNewsDetailServiceImpl extends CachedNewsDetailService {
  final NewsRepository repository;

  CachedNewsDetailServiceImpl(this.repository);

  @override
  Future<XNews> getNews(String id) async {
    final XNews news = cached[id];
    if (news is XNews)
      return news;
    else {
      return repository.getXNews(id).then((XNews xnews) => cached[id] = xnews);
    }
  }

  @override
  Future<List<XNews>> getListCachedNews() async {
    return cached.values.toList();
  }
}
