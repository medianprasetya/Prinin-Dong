// lib/home/homepage.dart

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
     appBar: AppBar(
  centerTitle: true,
  title: const Text('Prinin Dong', style: TextStyle(color: Colors.white)),
  backgroundColor: Colors.red,
  elevation: 50.0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(20.0),
      bottomRight: Radius.circular(20.0),
    ),
  ),
),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                // Background Blur
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(248, 249, 198, 195)
                        .withOpacity(0.6),
                  ),
                ),

                // Content
                ListView(
                  children: const [
                    Column(
                      children: [
                        SaldoHome(),
                        Column(
                          children: [
                            Text(
                              "Fitur :",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.deepOrange),
                            ),
                          ],
                        ),
                        FiturHome(),
                      ],
                    ),
                  ],
                ),

                DraggableScrollableSheet(
                  initialChildSize: 0.4, // Ukuran awal sheet saat minimized
                  maxChildSize: 0.78, // Ukuran maksimal sheet saat expanded
                  minChildSize: 0.2, // Ukuran minimal sheet saat minimized
                  builder: (context, scrollController) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      decoration: BoxDecoration(
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
                          Container(
                            height: 10,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          SizedBox(height: 40),

                          // Isi komentar atau formulir komentar
                         Column(
                          children: [
                            // Widget komentar
                            for (int i = 0; i < 1000; i++)
                              ListTile(
                                leading: Icon(i % 4 == 0 ? Icons.check : Icons.access_time_filled_sharp, color:(i % 4 == 0 ? Colors.red : Colors.black87)),
                                title: Text('Print Document'),
                                trailing: Text('2024.01.${i + 1}'),
                              ),
                          ],
                        ),
                        ],
                      ),
                    );
                  },
                ),

                // Positioned Widget for Bottom Center
                // Positioned(
                //   bottom: -constraints.maxHeight / 4,
                //   width: constraints.maxWidth,
                //   child: Center(
                //     child: Container(
                //       margin: const EdgeInsets.all(20),
                //       height: constraints.maxHeight / 2,
                //       decoration: const BoxDecoration(
                //         borderRadius: BorderRadius.all(Radius.circular(20)),
                //         gradient: LinearGradient(
                //           colors: [
                //             Color.fromARGB(255, 255, 255, 255),
                //             Color.fromARGB(255, 255, 255, 255),
                //           ],
                //           begin: Alignment.topLeft,
                //           end: Alignment.bottomRight,
                //         ),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Color.fromARGB(25, 0, 0, 0),
                //             spreadRadius: 1,
                //             blurRadius: 25,
                //             offset: Offset(10, 0),
                //           ),
                //         ],
                //       ),
                //       child: const ListTile(
                //         leading: Icon(Icons.check),
                //         title: Text('Print Document'),
                //         trailing: Text('2024.01.15'),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            );
          },
        ),
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
                  child: const Text(
                    "Cetak PDF",
                    style: TextStyle(fontSize: 14),
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
                  child: const Text(
                    "Cetak File",
                    style: TextStyle(fontSize: 14),
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
      child: const ListTile(
        contentPadding: EdgeInsets.all(30),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 30,
          child: Icon(
            Icons.print_rounded,
            size: 42,
            color: Colors.red,
          ),
        ),
        title: SizedBox(
          child: Text(
            'Saldo : Rp. 6000.00',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Text(
          'Eko Ganteng Kali',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
