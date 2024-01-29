
import 'package:flutter/material.dart';
import 'package:lpk_ihmi_mobile/services/apiInformasiStatic.dart';

// ignore: use_key_in_widget_constructors
class ContactsPagee extends StatelessWidget {

  const ContactsPagee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Informasi LPK IHMI CIREBON'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: ApiInformasiStatic.getInformasi(),
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
                  // leading: CircleAvatar(
                  //   radius: 30,
                  //   // ignore: prefer_interpolation_to_compose_strings
                  //   backgroundImage: Image.network('/api/informasi' +
                  //               snapshot.data![index]['gambar'])
                  //       .image,
                  // ),
                  title: Text(snapshot.data![index]['createdAt'] +
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
