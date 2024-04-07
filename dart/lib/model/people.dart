import 'package:chuva_dart/model/role.dart';
import 'package:chuva_dart/model/title.dart';

class People {
  int? id;
  String? title;
  String? name;
  String? institution;
  Title? bio;
  String? picture;
  int? weight;
  Role? role;
  String? hash;

  People(
      {this.id,
      this.title,
      this.name,
      this.institution,
      this.bio,
      this.picture,
      this.weight,
      this.role,
      this.hash});

  People.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    name = json['name'];
    institution = json['institution'];
    bio = json['bio'] != null ? Title.fromJson(json['bio']) : null;
    picture = json['picture'];
    weight = json['weight'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['name'] = name;
    data['institution'] = institution;
    if (bio != null) {
      data['bio'] = bio!.toJson();
    }
    data['picture'] = picture;
    data['weight'] = weight;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    data['hash'] = hash;
    return data;
  }
}
