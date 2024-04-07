class Links {
  String? self;
  String? next;

  Links({this.self, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self;
    data['next'] = next;
    return data;
  }
}
