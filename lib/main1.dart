import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lpk_ihmi_mobile/constant.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(title: 'LOGIN to LPK IHMI CIREBON'),      
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  // ignore: library_private_types_in_public_api
  _MyLoginpageState createState() => _MyLoginpageState();
}

class _MyLoginpageState extends State<LoginPage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  String msg = '';

  Future userLogin() async {
    // print(pass);
    // print(user);
    final response = await http.post(
        Uri.parse("http://localhost:8080/api/login"),
        body: {
          "UNAME": user.text,
          "UPASS": pass.text,
        });

    final datauser = jsonDecode(response.body);

    if (datauser.length == 0) {
      // ignore: use_build_context_synchronously
      // Navigator.pushReplacementNamed(context, 'home');
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => const HomePage(title: "Home"),
      //   ),
      // );
    } else {
      if (datauser[0]) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, 'home');
      }
    }

    // ignore: avoid_print
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5E5E5),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/lpk_ihmi.png'),
                  ),
                ),
              ),
              Text(
                "Selamat Datang",
                style: textTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 11),
              Text(
                "Di Aplikasi Mobile LPK IHMI CIREBON",
                style: secondaryTextStyle.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 64),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Email",
                        style: textTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: TextFormField(
                          controller: user,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Masukan Email anda..",
                            hintStyle: textTextStyle.copyWith(
                              fontSize: 12,
                              color: textColor.withOpacity(0.6),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 17),
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please Enter Email';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Password",
                        style: textTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: TextFormField(
                          controller: pass,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Masukan Password anda..",
                            hintStyle: textTextStyle.copyWith(
                              fontSize: 12,
                              color: textColor.withOpacity(0.6),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 17),
                            suffixIcon: const Icon(Icons.visibility_off),
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please Enter Password';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Row(
              //       children: [
              //         Container(
              //           width: 24,
              //           height: 24,
              //           decoration: BoxDecoration(
              //             color: buttonColor,
              //             borderRadius: BorderRadius.circular(5),
              //           ),
              //         ),
              //         const SizedBox(
              //           width: 15,
              //         ),
              //         Text(
              //           "Remember Me",
              //           style: greyTextStyle.copyWith(fontSize: 12),
              //         ),
              //       ],
              //     ),
              //     Text(
              //       "Forget Password",
              //       style: textTextStyle.copyWith(fontSize: 12),
              //     ),
              //   ],
              // ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: Text(
                  "Setelah mengisi form tekan tombol LOGIN",
                  style: secondaryTextStyle.copyWith(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ),
              // const SizedBox(
              //   height: 32,
              // ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: primaryButtonColor,
                  ),
                  onPressed: () {
                    userLogin();
                  },
                  // child: Text(
                  //   msg,
                  //   style: const TextStyle(fontSize: 20.0, color: Colors.red),
                  // ),
                  child: Text(
                    msg.isEmpty ? "LOGIN" : msg,
                    style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
