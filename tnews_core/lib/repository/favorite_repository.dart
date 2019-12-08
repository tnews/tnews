part of t_core.repository;

abstract class FavoriteRepository {
  Future<List<XNews>> getAllFavoriteNews();
  Future<bool> delete(String id);
  Future<bool> add(XNews news);

  Future<bool> isFavorite(String id);
}

class LocalFavoriteRepository extends FavoriteRepository {
  @protected
  final SharedPreferences shared;

  LocalFavoriteRepository(this.shared);

  @override
  Future<bool> add(XNews news) {
    return getAllFavoriteNews()
        .then((List<XNews> favoritesNews) {
          favoritesNews.removeWhere((XNews item) => item.id == news.id);
          return favoritesNews..add(news);
        })
        .then((List<XNews> news) => news.map((XNews item) => json.encode(item.toJson())).toList())
        .then((List<String> strNews) => shared.setStringList(_StorageKeys.favorite_news, strNews));
  }

  @override
  Future<bool> delete(String id) {
    return getAllFavoriteNews()
        .then((List<XNews> favoritesNews) {
          favoritesNews.removeWhere((XNews item) => item.id == id);
          return favoritesNews;
        })
        .then((List<XNews> news) => news.map((XNews item) => json.encode(item.toJson())).toList())
        .then((List<String> strNews) => shared.setStringList(_StorageKeys.favorite_news, strNews));
  }

  Future<List<XNews>> getAllFavoriteNews() async {
    final List<String> jsonNews = shared.getStringList(_StorageKeys.favorite_news) ?? <String>[];
    return jsonNews.map((String str) => XNews.fromJson(json.decode(str))).toList();
  }

  @override
  Future<bool> isFavorite(String id) {
    return getAllFavoriteNews()
        .then((_) => _.asMap().map((_, XNews item) => MapEntry<String, XNews>(item.id, item)))
        .then((Map<String, XNews> item) => item[id] != null);
    // .then((_) => _.firstWhere((XNews news) => news.id == id, orElse: () => null))
    // .then((XNews news) => news != null);
  }
}
