part of t_core.service;

abstract class NewsService {
  Future<List<Language>> getLanguages();
  Future<List<Category>> getCategories();
  Future<List<News>> searchNews([SearchRequest request]);
  Future<List<XNews>> searchXNews(int offset, {int limit, String categoryId});
}

class NewsServiceImpl extends NewsService {
  final NewsRepository repository;

  NewsServiceImpl(this.repository);

  @override
  Future<List<News>> searchNews([SearchRequest request]) {
    final SearchRequest req = request ?? SearchRequest.defaultSearchNews();
    return repository.searchNews(req);
  }

  @override
  Future<List<Category>> getCategories() {
    return repository.getCategories();
  }

  @override
  Future<List<Language>> getLanguages() {
    return repository.getLanguages();
  }

  @override
  Future<List<XNews>> searchXNews(int offset, {int limit, String categoryId}) {
    return repository.searchXNews(offset, limit, categoryId);
  }
}
