import 'package:chuva_dart/model/title.dart';

class Category {
  int? id;
  Title? title;
  String? color;
  String? backgroundColor;

  Category({this.id, this.title, this.color, this.backgroundColor});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    color = json['color'];
    backgroundColor = json['background-color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['color'] = color;
    data['background-color'] = backgroundColor;
    return data;
  }
}
