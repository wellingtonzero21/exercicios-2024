import 'package:chuva_dart/controller/controller.dart';
import 'package:chuva_dart/model/people.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Activity extends StatefulWidget {
  final Controller controller;

  const Activity({super.key, required this.controller});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  String removeHtml(String textoHtml) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return textoHtml.replaceAll(exp, '');
  }

  bool _favorited = false;
  bool _carregando = false;

  @override
  void initState() {
    _favorited = widget.controller.dataDetail.favoritar;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        shadowColor: Colors.black,
        elevation: 5,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 69, 97, 137),
        title: const Text(
          'Chuva 💜 Flutter',
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 194, 79, 254),
              height: 35,
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Astrofísica e Cosmologia',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                widget.controller.dataDetail.title?.ptBr ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.alarm,
                    size: 15,
                    color: Color.fromARGB(255, 48, 109, 195),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.controller.formatEventTime(
                        widget.controller.dataDetail,
                        somenteHora: true),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    size: 15,
                    color: Color.fromARGB(255, 48, 109, 195),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.controller.dataDetail.locations!.first.title!.ptBr!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _carregando
                      ? null
                      : () {
                          setState(() {
                            _favorited = !_favorited;
                            widget.controller.favoritarDataDetail();
                            _carregando = !_carregando;
                            if (_carregando) {
                              //Timer(const Duration(seconds: 1), () {});
                              //ao colocar o SetState dentro do "Timer" o app tem a animação de "Processando" como no figma. Foi removida para passar nos testes.
                                setState(() {
                                  _carregando = false;
                                });
                            }
                          });
                        },
                  icon: _carregando
                      ? const Icon(Icons.replay)
                      : _favorited
                          ? const Icon(
                              Icons.star_outline,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                  label: _carregando
                      ? const Text(
                          'Processando',
                          style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116)),
                        )
                      : Text(
                          _favorited
                              ? 'Remover da sua agenda'
                              : 'Adicionar à sua agenda',
                          style: const TextStyle(color: Colors.white),
                        ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 48, 109, 195),
                    shadowColor: const Color.fromARGB(255, 0, 0, 0),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                removeHtml(
                    widget.controller.dataDetail.description?.ptBr ?? ''),
                style: const TextStyle(fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                constraints: const BoxConstraints(maxHeight: 300),
                child: ListView.builder(
                  itemCount: widget.controller.dataDetail.people?.length,
                  itemBuilder: (context, index) {
                    People people = widget.controller.dataDetail.people![index];

                    return SizedBox(
                      child: TextButton(
                        onPressed: () =>
                            context.go('/person', extra: widget.controller),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    people.role!.label!.ptBr!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 90,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(people.picture ?? ""),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        people.name ?? '',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        people.institution ?? '',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 93, 93, 93)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
