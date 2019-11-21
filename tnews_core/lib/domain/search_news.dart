part of t_core.domain;

class SearchNews {
  int total = 0;
  final List<News> records;

  SearchNews({this.total, this.records});

  SearchNews.fromJson(Map<String, dynamic> json) : records = <News>[] {
    total = json['total'] ?? 0;
    if (json['records'] != null) {
      final List<News> news = _parseNews(json['records']);
      records.addAll(news);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = this.total;
    if (this.records != null) {
      data['records'] = this.records.map((News v) => v.toJson()).toList();
    }
    return data;
  }
}

List<News> _parseNews(List<Map<String, dynamic>> listNews) {
  List<News> news = <News>[];
  if (json != null) {
    news = listNews.map((Map<String, dynamic> json) => News.fromJson(json)).toList();
  }
  return news;
}
