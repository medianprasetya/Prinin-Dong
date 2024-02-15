// lib/home/homepage.dart

import 'package:flutter/material.dart';
import '/view/home/homeinfo.dart';
import '/view/home/homeprofile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/homepage';
  @override
  Widget build(BuildContext context) {
    dynamic x = 15;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Background Blur
              Container(
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(248, 249, 198, 195).withOpacity(0.6),
                ),
              ),

              // Content
              ListView(
                children: [
                  Column(
                    children: [
                      const SaldoHome(),
                      Column(
                        children: [
                          Text(
                            "Fitur :",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width > 200
                                  ? 16
                                  : MediaQuery.of(context).size.width * 0.015,
                              // MediaQuery.of(context).size.height * 0.015,
                            ),
                          )
                        ],
                      ),
                      const FiturHome(),
                    ],
                  ),
                ],
              ),

              DraggableScrollableSheet(
                snap: true,
                snapAnimationDuration: const Duration(milliseconds: 400),
                initialChildSize: 0.4, // Ukuran awal sheet saat minimized
                maxChildSize: 0.75, // Ukuran maksimal sheet saat expanded
                minChildSize: 0.25, // Ukuran minimal sheet saat minimized
                builder: (context, scrollController) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width > 600 ? 30 : 20,
                        vertical: 12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(25, 0, 0, 0),
                          spreadRadius: 1,
                          blurRadius: 25,
                          offset: Offset(10, 0),
                        ),
                      ],
                    ),
                    child: ListView(
                      controller: scrollController,
                      children: [
                        // Header untuk menunjukkan bahwa ini adalah area yang dapat ditarik
                        // SizedBox(height: 40),

                        // Isi komentar atau formulir komentar
                        Column(
                          children: [
                            // Widget komentar
                            for (int i = 0; i < x; i++)
                              ListTile(
                                leading: Icon(
                                    i % 4 == 0
                                        ? Icons.check
                                        : Icons.access_time_filled_sharp,
                                    color: (i % 4 == 0
                                        ? Colors.red
                                        : const Color.fromARGB(
                                            221, 191, 33, 223))),
                                title: Text(
                                  'Print Document',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width > 200
                                            ? 16
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.015,
                                  ),
                                ),
                                trailing: Text(
                                  '2024.01.${i + 1}',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width > 200
                                            ? 14
                                            : MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.015,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class FiturHome extends StatelessWidget {
  const FiturHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.width > 600 ? 500 : 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  print("Tombol Cetak PDF ditekan");
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 251, 251),
                        Color.fromARGB(255, 255, 255, 255),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(25, 0, 0, 0),
                        spreadRadius: 1,
                        blurRadius: 25,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width > 600 ? 250 : 120,
                  height: 100,
                  child: const Icon(
                    Icons.picture_as_pdf_rounded,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Cetak PDF",
                    style: TextStyle(
                      // fontSize: MediaQuery.of(context).size.height * 0.015,
                      // fontSize: 14,
                      fontSize:
                          MediaQuery.of(context).size.width > 200 ? 14 : 14,
                    ),
                  ))
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  print("Tombol Cetak File ditekan");
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 251, 251),
                        Color.fromARGB(255, 255, 255, 255),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(25, 0, 0, 0),
                        spreadRadius: 1,
                        blurRadius: 25,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width > 600 ? 250 : 120,
                  height: 100,
                  child: const Icon(
                    Icons.print_rounded,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Cetak File",
                    style: TextStyle(
                      // fontSize: MediaQuery.of(context).size.height * 0.015,
                      // fontSize: 14,
                      fontSize:
                          MediaQuery.of(context).size.width > 200 ? 14 : 14,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class SaldoHome extends StatelessWidget {
  const SaldoHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 79, 66),
            Color.fromARGB(255, 255, 161, 161),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(25, 0, 0, 0),
            spreadRadius: 1,
            blurRadius: 20,
            offset: Offset(0, 15),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(30),
        leading: InkWell(
          onTap: () {
            print(context);
            Navigator.of(context).pushNamed(HomeProfile.routeName);
          },
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 30,
            child: Icon(
              Icons.print_rounded,
              size: 42,
              color: Colors.red,
            ),
          ),
        ),
        title: SizedBox(
          child: Text(
            'Saldo : Rp. 6000.00',
            style: TextStyle(
              // fontSize: MediaQuery.of(context).size.height * 0.015,
              // fontSize: 14,
              fontSize: MediaQuery.of(context).size.width > 200 ? 18 : 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Text(
          'Eko Ganteng Kalie',
          style: TextStyle(
            // fontSize: MediaQuery.of(context).size.height * 0.015,
            // fontSize: 14,
            fontSize: MediaQuery.of(context).size.width > 200 ? 18 : 14,
            color: Colors.white,
          ),
        ),
        trailing:
            // TextButton(
            //     onPressed: () {
            //       Navigator.of(context).pushNamed(HomeInfo.routeName);
            //     },
            //     child: Icon(
            //       Icons.info_outline_rounded,
            //       size: 40,
            //       color: Colors.white,
            //     )),
            InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(HomeInfo.routeName);
          },
          child: const Icon(
            Icons.info_rounded,
            size: 30,
            color: Colors.white,
            shadows: [
              Shadow(
                  color: Colors.black54,
                  offset: Offset.infinite, //untuk full width
                  blurRadius: 1.2)
            ],
          ),
        ),
      ),
    );
  }
}
