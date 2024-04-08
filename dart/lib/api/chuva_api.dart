import 'dart:convert';

import 'package:chuva_dart/model/chuva_model.dart';
import 'package:dio/dio.dart';

class ChuvaAPI {
  final dio = Dio();

  Future<ChuvaModel> getHttp(
      {String endpoint =
          'https://raw.githubusercontent.com/chuva-inc/exercicios-2023/master/dart/assets/activities.json'}) async {
    try {
      Response response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        Map<String, dynamic> mapJson = jsonDecode(response.data);

        ChuvaModel chuvaModel = ChuvaModel.fromJson(mapJson);

        return chuvaModel;
      } else {
        throw 'Codigo de Erro: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Erro ao obter os dados $e';
    }
  }
}
