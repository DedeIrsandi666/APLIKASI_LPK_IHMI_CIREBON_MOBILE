import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lpk_ihmi_mobile/constant.dart';

// ignore: use_key_in_widget_constructors
class ContactsPage extends StatelessWidget {
  Future<List<dynamic>> fetchData() async {
    // List listData;
    //const String apiUrl = "http://192.168.100.171:8000/api/informasi";
    const String apiUrl2 = "$apiUrl/api/informasi";

    final response = await http.get(Uri.parse(apiUrl2));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];

      log("RESPONSE == $data");
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Halaman Informasi LPK IHMI CIREBON'),
  //     ),
  //     body: FutureBuilder<List<dynamic>>(
  //       future: fetchData(),
  //       builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return const Center(child: CircularProgressIndicator());
  //         } else if (snapshot.hasError) {
  //           return Center(child: Text('Error: ${snapshot.error}'));
  //         } else {
  //           return ListView.builder(
  //             padding: const EdgeInsets.all(10),
  //             itemCount: snapshot.data?.length,
  //             itemBuilder: (BuildContext context, int index) {
  //               return ListTile(
  //                 leading: CircleAvatar(
  //                   radius: 30,
  //                   // ignore: prefer_interpolation_to_compose_strings
  //                   backgroundImage: Image.network(
  //                           // ignore: prefer_interpolation_to_compose_strings
  //                           'http://localhost:8000/data_img/informasi/' +
  //                               snapshot.data![index]['gambar'])
  //                       .image,
  //                 ),
  //                 title: Text(snapshot.data![index]['postingan'] +
  //                     " " +
  //                     snapshot.data![index]['postingan']),
  //                 subtitle: Text(snapshot.data![index]['postingan']),
  //               );
  //             },
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarBackColor,
        title: const Center(
          child: Text(
            'Halaman Informasi LPK IHMI CIREBON',
            style: TextStyle(
              fontSize: 19,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return _buildPostItem(context, snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildPostItem(BuildContext context, dynamic post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              '$apiUrl/data_img/informasi/${post['gambar']}',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      post['created_at'],
                      style: const TextStyle(
                          fontSize: 10,
                          fontFamily: AutofillHints.jobTitle,
                          wordSpacing: 10.0),
                    ),
                    Text(
                      post['postingan'],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
