import 'package:chuva_dart/model/title.dart';

class Type {
  int? id;
  Title? title;

  Type({this.id, this.title});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    return data;
  }
}
