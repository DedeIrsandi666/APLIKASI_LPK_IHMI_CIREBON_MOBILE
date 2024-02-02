// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:lpk_ihmi_mobile/constant.dart';
// import 'package:lpk_ihmi_mobile/details.dart';
// //import 'package:shared_preferences/shared_preferences.dart';

// // ignore: use_key_in_widget_constructors
// // class EventsPage extends StatelessWidget {
// //   late List list = [];
// //   final String apiUrl = "http://localhost:8081/login_lpkihmi/peserta.php";
// //   EventsPage({Key? key, required this.list}) : super(key: key);

// //   Future<List<dynamic>> fetchData() async {
// //     final response = await http.get(Uri.parse(apiUrl));

// //     if (response.statusCode == 200) {
// //       final data = json.decode(response.body)['data'];
// //       return data;
// //     } else {
// //       throw Exception('Failed to load data');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: appbarBackColor,
// //         title: const Center(
// //           child: Text(
// //             'Halaman Daftar Peserta LPK IHMI CIREBON',
// //             style: TextStyle(
// //               fontSize: 19,
// //             ),
// //           ),
// //         ),
// //         automaticallyImplyLeading: false,
// //       ),
// //       body: FutureBuilder<List<dynamic>>(
// //         future: fetchData(),
// //         builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           } else {
// //             return ListView.builder(
// //               padding: const EdgeInsets.all(10),
// //               itemCount: snapshot.data?.length ?? 0, // Perbaiki kondisi itemCount
// //               itemBuilder: (BuildContext context, int index, ctx, i) {
// //                 return ListTile(
// //                   leading: CircleAvatar(
// //                     radius: 30,
// //                     backgroundImage: NetworkImage(
// //                       'http://localhost:8000/data_img/peserta/' +
// //                           snapshot.data![index]['foto'],
// //                     ),
// //                   ),
// //                   title: Text('Nama : ${snapshot.data![index]['nama']}'),
// //                   subtitle: Text(
// //                     'Angakatan : ${snapshot.data![index]['angkatan']}',
// //                     style: const TextStyle(
// //                       fontSize: 13,
// //                     ),
// //                   ),
// //                   onTap: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => DetailsPage(list: list, index: i),
// //                       ),
// //                     );
// //                   },
// //                 );
// //               },
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

// class EventsPage extends StatelessWidget {
//   const EventsPage({
//     Key? key,
//   }) : super(key: key);

//   Future<List<dynamic>> fetchData() async {
//     // ignore: unused_local_variable
//     List listData = [];
//     const String apiUrl1 = "$apiUrl/api/peserta";

//     final response = await http.get(Uri.parse(apiUrl1));

//     //data baru
//     //final token = await AuthService.getToken();
//     //final token = await _getToken();

//     //data baru

//     log("RESPONSE === $response");

//     //data baru

//     // if (token != null) {
//     //   final response = await http.get(
//     //     Uri.parse('$apiUrl/fetch-data'),
//     //     headers: {'Authorization': 'Bearer $token'},
//     //   );

//       //data baru

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body)['data'];

//         log("RESPONSE == $data");
//         return data;
//       } else {
//         throw Exception('Failed to load data');
//       }
//     }

//     // Future<String?> _getToken() async {
//     //   SharedPreferences prefs = await SharedPreferences.getInstance();
//     //   return prefs.getString('token');
//     // }

//     // ignore: unused_element
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: appbarBackColor,
//           title: const Center(
//             child: Text(
//               'Halaman Daftar Peserta LPK IHMI CIREBON',
//               style: TextStyle(
//                 fontSize: 19,
//               ),
//             ),
//           ),
//           automaticallyImplyLeading: false,
//         ),
//         body: FutureBuilder<List<dynamic>>(
//           future: fetchData(),
//           builder:
//               (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else {
//               return ListView.builder(
//                 padding: const EdgeInsets.all(10),
//                 itemCount: snapshot.data?.length ?? 0,
//                 itemBuilder: (BuildContext context, int index) {
//                   var dataItem = snapshot.data![index];
//                   return Container(
//                     child: Column(
//                       children: [
//                         const Text("Menu Pencarian",
//                         style: TextStyle(color: Colors.white,
//                         fontSize: 22.0,
//                         fontWeight: FontWeight.bold,
//                         ),),
//                         const SizedBox(
//                           height: 20.0,
//                         ),
//                         TextField(
//                           style: const TextStyle(color: Colors.white),
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: secondaryTextColor,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8.0),
//                               borderSide: BorderSide.none,
//                             ),
//                             hintText: "Pencarian berdasarkan Nama & Tahun Angkatna",
//                             // ignore: prefer_const_constructors
//                             suffixIcon: Icon(Icons.search),
//                             prefixIconColor: secondaryTextColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         radius: 30,
//                         backgroundImage: NetworkImage(
//                           '$apiUrl/data_img/peserta/' +
//                               snapshot.data![index]['foto'],
//                         ),
//                       ),
//                       title: Text('Nama : ${snapshot.data![index]['nama']}'),
//                       subtitle: Text(
//                         'Angakatan : ${snapshot.data![index]['angkatan']}',
//                         style: const TextStyle(
//                           fontSize: 13,
//                         ),
//                       ),
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   DetailsPage(dataItem: dataItem)),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       );
//     }
//   }

// // import 'dart:developer';

// // import 'package:flutter/material.dart';
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// // import 'package:lpk_ihmi_mobile/constant.dart';
// // import 'package:lpk_ihmi_mobile/details.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class EventsPage extends StatelessWidget {
// //   const EventsPage({
// //     Key? key,
// //   }) : super(key: key);

// //   Future<String?> _getToken() async {
// //       SharedPreferences prefs = await SharedPreferences.getInstance();
// //       return prefs.getString('token');
// //     }

// //   Future<List<dynamic>> fetchData() async {
// //     const String apiUrl1 = "$apiUrl/api/peserta";

// //     try {
// //       final response = await http.get(Uri.parse(apiUrl1));

// //       final token = await _getToken();

// //       log("RESPONSE === $response");

// //       if (token != null) {
// //         final response = await http.get(
// //           Uri.parse('$apiUrl/fetch-data'),
// //           headers: {'Authorization': 'Bearer $token'},
// //         );

// //         if (response.statusCode == 200) {
// //           final data = json.decode(response.body)['data'];

// //           log("RESPONSE == $data");
// //           return data;
// //         } else {
// //           throw Exception('Failed to load data');
// //         }
// //       } else {
// //         throw Exception('Token not available. Please login.');
// //       }

// //     } catch (e) {
// //       // ignore: avoid_print
// //       print (e); 
// //        rethrow;}
// //     }

// //     @override
// //     Widget build(BuildContext context) {
// //       return Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: appbarBackColor,
// //           title: const Center(
// //             child: Text(
// //               'Halaman Daftar Peserta LPK IHMI CIREBON',
// //               style: TextStyle(
// //                 fontSize: 19,
// //               ),
// //             ),
// //           ),
// //           automaticallyImplyLeading: false,
// //         ),
// //         body: FutureBuilder<List<dynamic>>(
// //           future: fetchData(),
// //           builder:
// //               (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return const Center(child: CircularProgressIndicator());
// //             } else if (snapshot.hasError) {
// //               return Center(child: Text('Error: ${snapshot.error}'));
// //             } else {
// //               return ListView.builder(
// //                 padding: const EdgeInsets.all(10),
// //                 itemCount: snapshot.data?.length ?? 0,
// //                 itemBuilder: (BuildContext context, int index) {
// //                   var dataItem = snapshot.data![index];
// //                   return ListTile(
// //                     leading: CircleAvatar(
// //                       radius: 30,
// //                       backgroundImage: NetworkImage(
// //                         // ignore: prefer_interpolation_to_compose_strings
// //                         '$apiUrl/data_img/peserta/' +
// //                             snapshot.data![index]['foto'],
// //                       ),
// //                     ),
// //                     title: Text('Nama : ${snapshot.data![index]['nama']}'),
// //                     subtitle: Text(
// //                       'Angkatan : ${snapshot.data![index]['angkatan']}',
// //                       style: const TextStyle(
// //                         fontSize: 13,
// //                       ),
// //                     ),
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                             builder: (context) =>
// //                                 DetailsPage(dataItem: dataItem)),
// //                       );
// //                     },
// //                   );
// //                 },
// //               );
// //             }
// //           },
// //         ),
// //       );
// //     }
// //   }