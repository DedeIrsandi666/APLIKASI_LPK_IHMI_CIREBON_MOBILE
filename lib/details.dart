import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

// ignore: use_key_in_widget_constructors, must_be_immutable
class DetailsPage extends StatelessWidget {
  dynamic dataItem;
  final String apiUrl = "http://localhost:8081/login_lpkihmi/peserta.php";

  // ignore: use_key_in_widget_constructors
  DetailsPage({required this.dataItem});

  // Future<List<dynamic>> fetchData() async {
  //   final response = await http.get(Uri.parse(apiUrl));

  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body)['data'];
  //     return data;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

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
        // padding: const EdgeInsets.all(15.0),
        // child: Column(
        //   children: [
        //     CircleAvatar(
        //       radius: 30,
        //       backgroundImage: NetworkImage(
        //         // ignore: prefer_interpolation_to_compose_strings
        //         'http://localhost:8000/data_img/peserta/' + dataItem['foto'],
        //       ),
        //     ),
        //     const SizedBox(height: 5),
        //     Text('Nama : ${dataItem['nama']}'),
        //     const SizedBox(height: 5),
        //     Text(
        //       'Angakatan : ${dataItem['angkatan']}',
        //       style: const TextStyle(
        //         fontSize: 13,
        //       ),
        //     ),
        //   ],
        // ),

        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                // ignore: prefer_interpolation_to_compose_strings
                'http://localhost:8000/data_img/peserta/' + dataItem['foto'],
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Nama : ${dataItem['nama']}',
                        style: const TextStyle(
                            fontSize: 16),
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
//       body: FutureBuilder<List<dynamic>>(
//         future: fetchData(),
//         builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return ListView.builder(
//               padding: const EdgeInsets.all(10),
//               itemCount: snapshot.data?.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   child: Container(
//                       children: [
//                         Row(

//                               leading: CircleAvatar(
//                                 radius: 30,
//                                 // ignore: prefer_interpolation_to_compose_strings
//                                 backgroundImage: Image.network(
//                                         // ignore: prefer_interpolation_to_compose_strings
//                                         'http://localhost:8000/data_img/peserta/' +
//                                             snapshot.data![index]['foto'])
//                                     .image,
//                               ),
//                               title: Text(snapshot.data![index]['nama']),
//                               subtitle: Text(snapshot.data![index]['angkatan']),

//                             ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
}
