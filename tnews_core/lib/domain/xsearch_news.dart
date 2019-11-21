part of t_core.domain;

class XSearchNews {
  int total = 0;
  final List<XNews> records;

  XSearchNews({this.total, this.records});

  XSearchNews.fromJson(Map<String, dynamic> json) : records = <XNews>[] {
    total = json['total'] ?? 0;
    if (json['records'] != null) {
      final List<XNews> news = _parseXNews(json['records']);
      records.addAll(news);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = this.total;
    if (this.records != null) {
      data['records'] = this.records.map((XNews v) => v.toJson()).toList();
    }
    return data;
  }
}

List<XNews> _parseXNews(List<Map<String, dynamic>> listNews) {
  List<XNews> news = <XNews>[];
  if (json != null) {
    news = listNews.map((Map<String, dynamic> json) => XNews.fromJson(json)).toList();
  }
  return news;
}
