part of t_core.domain.search_request;

class TermsQuery {
  String field;
  final List<String> values = <String>[];

  TermsQuery(this.field);

  TermsQuery.from(String field,List<String> values) {
    this.field = field;
    this.values.addAll(values);
  }
  
  TermsQuery.fromJson(Map<String, dynamic> json) {
    field = json['field'];
    if(json['values'] != null) {
      json['values'].forEach((dynamic v) => values.add(v));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['field'] = this.field;
    if (this.values != null) {
      data['values'] = this.values;
    }
    return data;
  }
}