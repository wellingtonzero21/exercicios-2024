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

  String formatEventTime(Data data, {bool somenteHora = false}) {
    if (somenteHora) {
      String startTime = data.start!.substring(11, 16);
      String endTime = data.end!.substring(11, 16);

      return '$startTime - $endTime';
    }

    String eventType = data.type!.title!.ptBr!;
    String startTime = data.start!.substring(11, 16);
    String endTime = data.end!.substring(11, 16);

    return '$eventType de $startTime até $endTime';
  }
}
