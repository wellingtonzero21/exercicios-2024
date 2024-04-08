import 'package:chuva_dart/model/data.dart';
import 'package:chuva_dart/model/links.dart';

class ChuvaModel {
  int? count;
  Links? links;
  List<Data>? data;

  ChuvaModel({this.count, this.links, this.data});

  ChuvaModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
