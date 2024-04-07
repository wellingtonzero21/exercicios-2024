import 'package:chuva_dart/controller/controller.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class Person extends StatefulWidget {
  final Controller controller;

  const Person({super.key, required this.controller});

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
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
            context.go('/activity', extra: widget.controller);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://static.galoa.com.br/file/Eventmanager-Private/styles/large/s3/eventmanager_person/Screenshot%202023-10-10%20at%2013.06.35.png?VersionId=4_z9e083e414507696175f50716_f10473fd681469d07_d20231010_m160744_c003_v0312007_t0020_u01696954064581\u0026itok=XSqu4FiW'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sthepen William Hawking',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Text(
                        'Universidade de Cambridge',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bio',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Doutor em cosmologia, foi professor lucasiano emérito na Universidade de Cambridge, um posto que foi ocupado por Isaac Newton, Paul Dirac e Charles Babbage. Foi, pouco antes de falecer, diretor de pesquisa do Departamento de Matemática Aplicada e Física Teórica (DAMTP) e fundador do Centro de Cosmologia Teórica (CTC) da Universidade de Cambridge.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 10,
              top: 20,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Atividades',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                        top: 3,
                      ),
                      child: Text(
                        'dom., 26/11/2023',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Card(
              elevation: 3,
              color: Colors.white,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: 7,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 162, 0, 255),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () =>
                            context.go('/activity', extra: widget.controller),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mesa redonda de 07:00 até 08:00',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                              ),
                              Text('A Física dos Buracos Negros Supermassivos',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                              Text('Sthepen William Hawking',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 121, 121, 121))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
