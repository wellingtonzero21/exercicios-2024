import 'package:chuva_dart/model/category.dart';
import 'package:chuva_dart/model/locations.dart';
import 'package:chuva_dart/model/people.dart';
import 'package:chuva_dart/model/title.dart';
import 'package:chuva_dart/model/type.dart';

class Data {
  int? id;
  int? changed;
  String? start;
  String? end;
  Title? title;
  Title? description;
  Category? category;
  List<Locations>? locations;
  Type? type;
  List<People>? people;
  int? status;
  int? weight;
  dynamic addons;
  int? parent;
  String? event;
  bool favoritar = false;

  Data(
      {this.id,
      this.changed,
      this.start,
      this.end,
      this.title,
      this.description,
      this.category,
      this.locations,
      this.type,
      this.people,
      this.status,
      this.weight,
      this.addons,
      this.parent,
      this.event,
      this.favoritar = false});

  favortitar() {
    favoritar = !favoritar;
  }

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    changed = json['changed'];
    start = json['start'];
    end = json['end'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Title.fromJson(json['description'])
        : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(Locations.fromJson(v));
      });
    }
    type = json['type'] != null ? Type.fromJson(json['type']) : null;

    if (json['people'] != null) {
      people = <People>[];
      json['people'].forEach((v) {
        people!.add(People.fromJson(v));
      });
    }
    status = json['status'];
    weight = json['weight'];
    addons = json['addons'];
    parent = json['parent'];
    event = json['event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['changed'] = changed;
    data['start'] = start;
    data['end'] = end;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (locations != null) {
      data['locations'] = locations!.map((v) => v.toJson()).toList();
    }
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (people != null) {
      data['people'] = people!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['weight'] = weight;
    data['addons'] = addons;
    data['parent'] = parent;
    data['event'] = event;
    return data;
  }
}
