part of t_core.service;

abstract class NewsService {
  Future<List<Language>> getLanguages();
  Future<List<Category>> getCategories();
  Future<List<News>> searchNews([SearchRequest request]);
  Future<List<XNews>> searchXNews([SearchRequest request]);
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
  Future<List<XNews>> searchXNews([SearchRequest request]) {
    final SearchRequest req = request ?? SearchRequest.defaultSearchNews();
    return repository.searchXNews(req);
  }

  @override
  Future<List<Category>> getCategories() {
    return repository.getCategories();
  }

  @override
  Future<List<Language>> getLanguages() {
    return repository.getLanguages();
  }
}
