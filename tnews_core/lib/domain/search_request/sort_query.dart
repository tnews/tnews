part of t_core.domain.search_request;

class SortQuery {
  static const String OrderAsc = 'ASC';
  static const String OrderDesc = 'DESC';
  
  String field;
  String order;

  SortQuery(this.field,this.order);

  SortQuery.fromJson(Map<String, dynamic> json) {
    field = json['field'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['field'] = this.field;
    data['order'] = this.order;
    return data;
  }
}