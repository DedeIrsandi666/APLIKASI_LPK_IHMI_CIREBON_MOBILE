// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lpk_ihmi_mobile/model/peserta.dart';

class DetailPesertaPage extends StatelessWidget {
  const DetailPesertaPage({Key? key, required this.peserta}) : super(key: key);
  final Peserta peserta;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1dd1a1),
          title: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              peserta.nama,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: const Color(0xff2d3436),
              ),
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: <Widget>[
                  Material(
                    color: Colors.white,
                    elevation: 15.0,
                    borderRadius: BorderRadius.circular(0.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Material(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: const Padding(
                                    padding: EdgeInsets.all(15.0),
                                    // child: Image.asset(
                                    //   'assets/images/user.png',
                                    //   width: 150,
                                    // ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28)),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const Text(
                                  'Nama :',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(peserta.nama),
                              ],
                            ),
                            // Row(
                            //   children: <Widget>[
                            //     const Text(
                            //       'Alamat :',
                            //       style: TextStyle(
                            //           fontSize: 17,
                            //           fontWeight: FontWeight.w700),
                            //     ),
                            //     const SizedBox(
                            //       width: 15,
                            //     ),
                            //     Text(peserta.tempatTanggalLahir.day.toString()),
                            //     const Text('-'),
                            //     Text(peserta.tempatTanggalLahir.month
                            //         .toString()),
                            //     const Text('-'),
                            //     Text(
                            //         peserta.tempatTanggalLahir.year.toString()),
                            //   ],
                            // ),
                            Row(
                              children: <Widget>[
                                const Text(
                                  'Alamat :',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(peserta.alamat)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                const Text(
                                  'Email :',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(peserta.email),
                              ],
                            ),
                            // Row(
                            //   children: <Widget>[
                            //     const Text(
                            //       'Nomor Anggota :',
                            //       style: TextStyle(
                            //           fontSize: 17,
                            //           fontWeight: FontWeight.w700),
                            //     ),
                            //     const SizedBox(
                            //       width: 15,
                            //     ),
                            //     Text(anggota.nomorAnggota),
                            //   ],
                            // ),
                            Row(
                              children: <Widget>[
                                const Text(
                                  'Angkatan :',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(peserta.angkatan),
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
