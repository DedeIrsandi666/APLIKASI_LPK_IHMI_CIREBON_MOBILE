import 'package:flutter/material.dart';
import 'package:lpk_ihmi_mobile/login.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(title: 'LOGIN to LPK IHMI CIREBON'),
      // routes: {
      //   'home': (BuildContext context) => const HomePage(title: 'Halaman Home'),
      //   'login': (BuildContext context) => const LoginPage(title: 'Halaman Login'),
      // },
    );
  }
}
