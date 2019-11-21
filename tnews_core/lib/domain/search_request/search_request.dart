part of t_core.domain.search_request;

class SearchRequest {
  final List<TermsQuery> terms = <TermsQuery>[];
  final List<SortQuery> sorts = <SortQuery>[];
  int from;
  int size;

  SearchRequest(this.from, this.size);

  SearchRequest.defaultSearchNews()
      : from = 0,
        size = 15 {
    this.addSort(SortQuery('published_time', 'desc'));
  }

  SearchRequest addTermsQuery(TermsQuery query) {
    terms.add(query);
    return this;
  }

  SearchRequest addSort(SortQuery query) {
    sorts.add(query);
    return this;
  }

  SearchRequest.fromJson(Map<String, dynamic> json) {
    if (json['terms'] != null)
      json['terms'].forEach((dynamic v) => terms.add(TermsQuery.fromJson(v)));

    if (json['sorts'] != null)
      json['sorts'].forEach((dynamic v) => sorts.add(SortQuery.fromJson(v)));
    from = json['from'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['terms'] = this.terms.map((dynamic x) => x.toJson()).toList();
    data['sorts'] = this.sorts.map((dynamic x) => x.toJson()).toList();
    data['from'] = this.from;
    data['size'] = this.size;
    return data;
  }
}
