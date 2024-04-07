import 'package:chuva_dart/model/title.dart';

class Locations {
  int? id;
  Title? title;
  int? parent;
  dynamic map;

  Locations({this.id, this.title, this.parent, this.map});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    parent = json['parent'];
    map = json['map'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['parent'] = parent;
    data['map'] = map;
    return data;
  }
}
