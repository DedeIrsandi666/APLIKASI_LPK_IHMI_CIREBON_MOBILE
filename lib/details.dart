import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:lpk_ihmi_mobile/constant.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class DetailsPage extends StatelessWidget {
  dynamic dataItem;
  //final String apiUrl = "http://localhost:8081/login_lpkihmi/peserta.php";

  // ignore: use_key_in_widget_constructors
  DetailsPage({required this.dataItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Halaman Detail Peserta LPK IHMI CIREBON',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                // ignore: prefer_interpolation_to_compose_strings
                '$apiUrl/data_img/peserta/' + dataItem['foto'],
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Nama : ${dataItem['nama']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Alamat : ${dataItem['alamat']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Angkatan : ${dataItem['angkatan']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
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
