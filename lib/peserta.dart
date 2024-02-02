import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lpk_ihmi_mobile/constant.dart';
import 'package:lpk_ihmi_mobile/details.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({
    Key? key,
  }) : super(key: key);

  Future<List<dynamic>> fetchData() async {
    // ignore: unused_local_variable
    List listData = [];
    const String apiUrl1 = "$apiUrl/api/peserta";

    final response = await http.get(Uri.parse(apiUrl1));

    log("RESPONSE === $response");

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];

      log("RESPONSE == $data");
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarBackColor,
        title: const Center(
          child: Text(
            'Halaman Daftar Peserta LPK IHMI CIREBON',
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
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      var dataItem = snapshot.data![index];
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            '$apiUrl/data_img/peserta/' +
                                snapshot.data![index]['foto'],
                          ),
                        ),
                        title: Text('Nama : ${snapshot.data![index]['nama']}'),
                        subtitle: Text(
                          'Angkatan : ${snapshot.data![index]['angkatan']}',
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(dataItem: dataItem),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
