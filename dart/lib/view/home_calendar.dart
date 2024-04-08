import 'package:chuva_dart/api/chuva_api.dart';
import 'package:chuva_dart/components/my_card.dart';
import 'package:chuva_dart/controller/controller.dart';
import 'package:chuva_dart/model/chuva_model.dart';
import 'package:chuva_dart/model/data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _currentDate = DateTime(2023, 11, 26);

  ChuvaModel? chuvaModel;

  List<Data> listDate = [];

  Controller controller = Controller();

  void _changeDate(DateTime newDate) {
    setState(() {
      _currentDate = newDate;

      controller.listFiltred = filterDataByDate(_currentDate);
    });
  }

  List<Data> filterDataByDate(DateTime date) {
    List<Data> datelist = listDate;

    List<Data> filteredDate = datelist.where((data) {
      DateTime startDate = DateTime.parse(data.start!);
      DateTime endDate = DateTime.parse(data.end!);

      return startDate.year == date.year &&
              startDate.month == date.month &&
              startDate.day == date.day ||
          endDate.year == date.year &&
              endDate.month == date.month &&
              endDate.day == date.day;
    }).toList();

    return filteredDate;
  }

  @override
  void initState() {
    init();

    controller.streamController.stream.listen((event) {
      if (event == true) {
        setState(() {});
      }
    });

    super.initState();
  }

  init() async {
    ChuvaAPI chuvaAPI = ChuvaAPI();

    chuvaModel = await chuvaAPI.getHttp();

    if (chuvaModel?.links?.next != null) {
      ChuvaModel chuvaModelAux =
          await chuvaAPI.getHttp(endpoint: chuvaModel!.links!.next!);

      chuvaModel?.data!.addAll(chuvaModelAux.data!);
    }

    listDate = chuvaModel!.data!;

    controller.listFiltred = filterDataByDate(_currentDate);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: 5,
        toolbarHeight: 130,
        backgroundColor: const Color.fromARGB(255, 69, 97, 137),
        title: Column(
          children: [
            const Center(
                child: Text(
              'Chuva 💜 Flutter',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            )),
            const Text(
              'Programação',
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 45,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 59),
                    child: Container(
                        height: 36,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 48, 109, 195),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: const Icon(Icons.calendar_month_outlined)),
                  ),
                  const Text(
                    'Exibindo todas atividades',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 48, 109, 195),
            child: Row(
              children: [
                Container(
                  width: 60,
                  color: Colors.white,
                  child: const Column(
                    children: [
                      Text(
                        'Nov',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '2023',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                      child: TextButton(
                        onPressed: () {
                          _changeDate(DateTime(2023, 11, 26));
                        },
                        child: const Text(
                          '26',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: TextButton(
                        onPressed: () {
                          _changeDate(DateTime(2023, 11, 27));
                        },
                        child: const Text(
                          '27',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: TextButton(
                        onPressed: () {
                          _changeDate(DateTime(2023, 11, 28));
                        },
                        child: const Text(
                          '28',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: TextButton(
                        onPressed: () {
                          _changeDate(DateTime(2023, 11, 29));
                        },
                        child: const Text(
                          '29',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: TextButton(
                        onPressed: () {
                          _changeDate(DateTime(2023, 11, 30));
                        },
                        child: const Text(
                          '30',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: chuvaModel == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.listFiltred.length,
                    itemBuilder: (context, index) {
                      Data data = controller.listFiltred[index];

                      return MyCard(
                        controller: controller,
                        data: data,
                        onTap: () {
                          controller.dataDetail = data;
                          context.go('/activity', extra: controller);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
