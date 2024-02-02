import 'package:flutter/material.dart';
import 'package:lpk_ihmi_mobile/detailpeserta.dart';
import 'package:lpk_ihmi_mobile/services/apiPesertaStatic.dart';
// import 'package:get/get.dart';

// class PesertaPage extends GetConnect{
//   Future<Response> getData(var data) {
//     var myHeader = {
//       'Accept': 'application/json',
//       'Authorization' : 'Bearer ${SpUtil.getString("token")!}',
//     };
//     return get('http://192.168.43.64/api/peserta', headers: myHeader);
//   }
// }

// ignore: use_key_in_widget_constructors
class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  get navigator => null;

  get listPeserta => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Daftar Peserta LPK IHMI CIREBON'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: ApiPesertaStatic.getPeserta(),
        builder: (context, snapshot) {
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
                        snapshot.data![index]['foto']).image,
                  ),
                  title: Text(snapshot.data![index]['nama'] +
                      " " +
                      snapshot.data![index]['angkatan']),
                  subtitle: Text(snapshot.data![index]['angkatan']),
                  onTap: () {
                    navigator.of(context).push(MaterialPageRoute(
                          builder: (
                            BuildContext context,
                          ) =>
                              DetailPesertaPage(peserta: listPeserta[index]),
                        ));
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

// const Text(
                //   "Menu Pencarian",
                //   textAlign: TextAlign.left,
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 15.0,
                //     fontWeight: FontWeight.normal,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10.0,
                // ),
                // TextField(
                //   style: const TextStyle(color: Colors.white),
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: Colors.grey,
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(5.0),
                //       borderSide: BorderSide.none,
                //     ),
                //     hintText: "Pencarian berdasarkan Nama & Tahun Angkatan",
                //     hintStyle: textTextStyle.copyWith(
                //       fontSize: 12,
                //       color: yesColor.withOpacity(0.6),
                //     ),
                //     // ignore: prefer_const_constructors
                //     suffixIcon: Icon(Icons.search),
                //     prefixIconColor: secondaryTextColor,
                //   ),
                // ),