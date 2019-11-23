part of t_core.service;

abstract class FavoriteService {
  Future<List<XNews>> getAllFavoriteNews();
  Future<bool> delete(String id);
  Future<bool> add(XNews news);
}

class FavoriteServiceImpl extends FavoriteService {
  final FavoriteRepository repository;

  FavoriteServiceImpl(this.repository);

  @override
  Future<bool> add(XNews news) {
    return repository.add(news);
  }

  @override
  Future<bool> delete(String id) {
    return repository.delete(id);
  }

  @override
  Future<List<XNews>> getAllFavoriteNews() {
    return repository.getAllFavoriteNews();
  }
}
