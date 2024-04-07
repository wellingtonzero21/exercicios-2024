import 'package:chuva_dart/model/title.dart';

class Role {
  int? id;
  Title? label;

  Role({this.id, this.label});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'] != null ? Title.fromJson(json['label']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (label != null) {
      data['label'] = label!.toJson();
    }
    return data;
  }
}
