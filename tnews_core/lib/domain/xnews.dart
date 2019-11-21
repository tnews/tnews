part of t_core.domain;

class XNews {
  String id;
  String lang;
  String source;
  String originId;
  List<String> categories;
  String headline;
  String description;
  List<String> contents;
  String htmlContent;
  String url;
  int status;
  String author;
  List<String> authors;
  String thumbnail;
  int updatedTime;
  int publishedTime;
  int createdTime;

  XNews(
      {this.id,
      this.lang,
      this.source,
      this.originId,
      this.categories,
      this.headline,
      this.description,
      this.contents,
      this.htmlContent,
      this.url,
      this.status,
      this.author,
      this.authors,
      this.thumbnail,
      this.updatedTime,
      this.publishedTime,
      this.createdTime});

  XNews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lang = json['lang'];
    source = json['source'];
    originId = json['origin_id'];
    categories = json['categories'].cast<String>();
    headline = json['headline'];
    description = json['description'];
    contents = json['contents'].cast<String>();
    htmlContent = json['html_content'];
    url = json['url'];
    status = json['status'];
    author = json['author'];
    authors = json['authors'].cast<String>();
    thumbnail = json['thumbnail'];
    updatedTime = json['updated_time'];
    publishedTime = json['published_time'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['lang'] = this.lang;
    data['source'] = this.source;
    data['origin_id'] = this.originId;
    data['categories'] = this.categories;
    data['headline'] = this.headline;
    data['description'] = this.description;
    data['contents'] = this.contents;
    data['html_content'] = this.htmlContent;
    data['url'] = this.url;
    data['status'] = this.status;
    data['author'] = this.author;
    data['authors'] = this.authors;
    data['thumbnail'] = this.thumbnail;
    data['updated_time'] = this.updatedTime;
    data['published_time'] = this.publishedTime;
    data['created_time'] = this.createdTime;
    return data;
  }
}
