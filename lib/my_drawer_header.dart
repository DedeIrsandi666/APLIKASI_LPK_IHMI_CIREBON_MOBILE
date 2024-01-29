import 'package:flutter/material.dart';


// ignore: use_key_in_widget_constructors
class MyHeaderDrawer extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
  color: Colors.purple[700],
  width: double.infinity,
  height: 200,
  padding: const EdgeInsets.only(top: 20.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        height: 70,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/images/lpk_ihmi.png'),
          ),
        ),
      ),
      const Text(
        "LPK IHMI CIREBON MOBILE",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      const Text(
        "by Mahasiswa Teknik Informatika",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
      ),
      const Text(
        "Universitas Catur Insan Cendekia",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
      ),
    ],
  ),
);

  }
}
