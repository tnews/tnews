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
    return repository.searchNews(request);
  }

  @override
  Future<List<XNews>> searchXNews([SearchRequest request]) {
    return repository.searchXNews(request);
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
