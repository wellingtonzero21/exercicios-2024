import 'package:chuva_dart/controller/controller.dart';
import 'package:chuva_dart/model/data.dart';
import 'package:flutter/material.dart';
import '../model/people.dart';

class MyCard extends StatelessWidget {
  final Data data;
  final VoidCallback onTap;
  final Controller controller;
  final String title;
  final String information;
  final String? people;

  const MyCard({
    super.key,
    required this.data,
    required this.onTap,
    required this.controller,
    required this.title,
    required this.information,
    this.people,
  });

  String getAuthorsNames(List<People> authors) {
    List<String> names = [];

    for (People author in authors) {
      names.add(author.name ?? '');
    }

    return names.join(', ');
  }

  Color hexToColor(String code) {
    if (code.startsWith('#')) {
      code = code.substring(1);
    }

    if (code.length == 6) {
      code = 'FF$code';
    }

    int colorValue = int.parse(code, radix: 16);

    return Color(colorValue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 7,
                decoration: BoxDecoration(
                  color: data.category?.color != null
                      ? hexToColor(data.category?.color ?? '')
                      : const Color.fromARGB(255, 162, 0, 255),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: onTap,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    controller.formatEventTime(data),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Visibility(
                                    visible: data.favoritar,
                                    child: const Icon(
                                      Icons.bookmark,
                                      color: Color.fromARGB(255, 107, 107, 107),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                            Visibility(
                              visible: data.people != null &&
                                  data.people!.isNotEmpty,
                              child: Text(
                                getAuthorsNames(data.people ?? []).trim(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 108, 108, 108),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
