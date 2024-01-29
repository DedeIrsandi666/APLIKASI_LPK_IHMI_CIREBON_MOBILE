import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lpk_ihmi_mobile/constant.dart';
import 'package:http/http.dart' as http;
import 'package:lpk_ihmi_mobile/home.dart';

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

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  // ignore: library_private_types_in_public_api
  _MyLoginpageState createState() => _MyLoginpageState();
}

class _MyLoginpageState extends State<LoginPage> {
  // _MyLoginpageState({Key? key}) : super(key: key);

  //For LinearProgressIndicator.
  // ignore: unused_field
  bool _visible = false;
  //Controller untuk Pengeditan Teks dalam Input Nama Pengguna dan Kata Sandi
  final userController = TextEditingController();
  final pwdController = TextEditingController();

  get errorText => null;

  Future userLogin() async {
    //Login API URL
    //dan gunakan alamat IP lokal atau localhost atau gunakan API Web
    String url = "http://localhost:8081/login_lpkihmi/user_login.php";

    setState(() {
      _visible = true;
    });
    // Mendapatkan nama pengguna dan kata sandi dari Controller
    var data = {
      'email': userController.text,
      'password': pwdController.text,
    };

    // ignore: avoid_print
    print(data);
//Memulai Panggilan WEB API.
    // var respons?e = await http.post(Uri.parse(url), body: json.encode(data));
    try {
      var response = await http.post(Uri.parse(url), body: json.encode(data));

      // ignore: avoid_print
      print(response.body);
      if (response.statusCode == 200) {
        var msg = jsonDecode(response.body);
        if (msg['loginStatus'] == true) {
          setState(() {
            _visible = false;
          });

          var userInfo = msg['userInfo'];
          if (userInfo != null) {
            // ignore: unused_local_variable
            var userName = userInfo['full_name'];

            Future.delayed(Duration.zero, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(title: "halo"),
                ),
              );
            });
          } else {
            showMessage("Invalid user information");
          }
        } else {
          setState(() {
            _visible = false;
            showMessage(msg["message"]);
          });
        }
      } else {
        setState(() {
          _visible = false;
          showMessage(
              "Error during connecting to Server. Status Code: ${response.statusCode}");
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error: $e'); // Print the error for debugging
      setState(() {
        _visible = false;
        showMessage("Error during connecting to Server: $e");
      });
    }
  }

  // ignore: no_leading_underscores_for_local_identifiers
  Future<dynamic> showMessage(String _msg) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_msg),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final _formKey = GlobalKey<FormState>();

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
                key: _formKey,
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
                          controller: userController,
                          decoration: InputDecoration(
                            errorText: errorText,
                            border: InputBorder.none,
                            hintText: "Masukan Email anda..",
                            hintStyle: textTextStyle.copyWith(
                              fontSize: 12,
                              color: textColor.withOpacity(0.6),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 17),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            }
                            return null;
                          },
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
                          controller: pwdController,
                          obscureText: true,
                          decoration: InputDecoration(
                            errorText: errorText,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
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
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      userLogin();
                    }
                  },
                  child: Text(
                    "LOGIN",
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
