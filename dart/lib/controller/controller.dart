import 'dart:async';

import 'package:chuva_dart/model/data.dart';

class Controller {
  List<Data> listFiltred = [];
  late Data dataDetail;

  StreamController<bool> streamController = StreamController<bool>();

  void favoritarDataDetail() {
    int index =
        listFiltred.indexWhere((element) => element.id == dataDetail.id);
    if (index != -1) {
      listFiltred[index].favoritar = !listFiltred[index].favoritar;
    }

    streamController.add(true);
  }
}
