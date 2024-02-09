import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lpk_ihmi_mobile/home.dart';
import 'package:lpk_ihmi_mobile/login.dart';
import 'package:get_storage/get_storage.dart';

// void main() async {
//   await GetStorage.init();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       //Get.to(LoginPage(title: 'LOGIN to LPK IHMI CIREBON')),
//       home: LoginPage(title: 'LOGIN to LPK IHMI CIREBON'),

//       // routes: {
//       //   'home': (BuildContext context) => const HomePage(title: 'Halaman Home'),
//       //   'login': (BuildContext context) => const LoginPage(title: 'Halaman Login'),
//       // },
//     );
//   }
// }

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(title: 'LOGIN to LPK IHMI CIREBON'),
      getPages: [
        GetPage(name: '/home', page: () => const HomePage(title: 'Halaman Home')),
        GetPage(name: '/login', page: () => const LoginPage(title: 'Halaman Login')),
      ],
    );
  }
}
