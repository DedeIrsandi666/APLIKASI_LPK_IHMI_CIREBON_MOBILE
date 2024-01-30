import 'package:flutter/material.dart';
import 'package:lpk_ihmi_mobile/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(title: 'LOGIN to LPK IHMI CIREBON'),
      // routes: {
      //   'home': (BuildContext context) => const HomePage(title: 'Halaman Home'),
      //   'login': (BuildContext context) => const LoginPage(title: 'Halaman Login'),
      // },
    );
  }
}
