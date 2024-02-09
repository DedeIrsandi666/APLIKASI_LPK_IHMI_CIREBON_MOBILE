import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lpk_ihmi_mobile/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lpk_ihmi_mobile/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<LoginPage> {
  // ignore: unused_field
  bool _visible = false;
  final userController = TextEditingController();
  final pwdController = TextEditingController();

  Future userLogin() async {
    String url = "$apiUrl/api/login";
    // ignore: no_leading_underscores_for_local_identifiers
    final _box = GetStorage();
    setState(() {
      _visible = true;
    });
    var data = {
      'email': userController.text,
      'password': pwdController.text,
    };

    setHeader() => {
          'Content-type': 'application/json',
          'accept': 'application/json'
        };

    try {
      var response = await http.post(Uri.parse(url),
          body: json.encode(data), headers: setHeader());

      if (response.statusCode == 200) {
        var msg = jsonDecode(response.body);
        final token = msg['token'];
        _box.write('login', token);

        if (msg['loginStatus'] == true) {
          setState(() {
            _visible = false;
          });

          var userInfo = msg['userInfo'];
          if (userInfo != null) {
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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 60.0,bottom: 10.0),
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
                    fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
