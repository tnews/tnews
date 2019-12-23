part of t_core.repository;

abstract class NewsRepository {
  Future<List<Language>> getLanguages();
  Future<List<Category>> getCategories();
  Future<List<News>> searchNews([SearchRequest request]);
  Future<List<XNews>> searchXNews(int offset, int limit, String categoryId);
  Future<XNews> getXNews(String id);
  Future<News> getNews(String id);
}

class NewsRepositoryImpl extends NewsRepository {
  final HttpClient client;

  NewsRepositoryImpl(this.client);
  @override
  Future<List<Category>> getCategories() {
    return client.get<List<dynamic>>('/news/category').then((_) => _parseCategories(_));
  }

  @override
  Future<List<Language>> getLanguages() {
    return client.get('/news/language').then((_) => parseLanguage(_));
  }

  @override
  Future<News> getNews(String id) {
    Logger.debug("getNews");
    return null;
  }

  @override
  Future<XNews> getXNews(String id) {
    Logger.debug("getXNews");

    return client.get('/news/getNews/$id').then((_) => XNews.fromJson(_));
  }

  List<Category> _parseCategories(List<dynamic> list) {
    return list
        .cast<Map<String, dynamic>>()
        .map((item) => Category.fromJson(item))
        .toList();
  }

  List<XNews> _parseNews(List<dynamic> list) {
    return list.cast<Map<String, dynamic>>().map((json) => XNews.fromJson(json)).toList();
  }

  List<Language> parseLanguage(List<dynamic> list) {
    return list
        .cast<Map<String, dynamic>>()
        .map((json) => Language.fromJson(json))
        .toList();
  }

  @override
  Future<List<News>> searchNews([SearchRequest request]) {
    return null;
  }

  @override
  Future<List<XNews>> searchXNews(int offset, int limit, String categoryId) {
    final Map map = <String, dynamic>{};
    map['offset'] = offset;
    map['limit'] = limit;
    map['category_id'] = categoryId;

    return client
        .get('/news', params: map)
        .then((_) => _parseNews(_))
        .catchError((_, x) => Logger.error(x));
  }
}
