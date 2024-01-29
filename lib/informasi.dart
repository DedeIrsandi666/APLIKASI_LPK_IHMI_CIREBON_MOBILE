import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: use_key_in_widget_constructors
class ContactsPage extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   // ignore: avoid_unnecessary_containers
  //   return Container(
  //     child: const Center(
  //       child: Text("Contacts Page")),
  //   );
  // }

  final String apiUrl = "http://localhost:8081/login_lpkihmi/informasi.php";

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      // ignore: avoid_print
      print(data);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Informasi LPK IHMI CIREBON'),
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
              padding: const EdgeInsets.all(10),
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    // ignore: prefer_interpolation_to_compose_strings
                    backgroundImage: Image.network(
                            // ignore: prefer_interpolation_to_compose_strings
                            'http://localhost:8000/data_img/informasi/' +
                                snapshot.data![index]['gambar'])
                        .image,
                  ),
                  title: Text(snapshot.data![index]['postingan'] +
                      " " +
                      snapshot.data![index]['postingan']),
                  subtitle: Text(snapshot.data![index]['postingan']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
