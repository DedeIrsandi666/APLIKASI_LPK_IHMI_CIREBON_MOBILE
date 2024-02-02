import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lpk_ihmi_mobile/constant.dart';
import 'package:lpk_ihmi_mobile/informasi.dart';
import 'package:lpk_ihmi_mobile/dashboard.dart';
import 'package:lpk_ihmi_mobile/main1.dart';
import 'package:lpk_ihmi_mobile/peserta.dart';
import 'package:lpk_ihmi_mobile/my_drawer_header.dart';
import 'package:lpk_ihmi_mobile/notes.dart';
import 'package:lpk_ihmi_mobile/notifications.dart';
import 'package:lpk_ihmi_mobile/privacy_policy.dart';
import 'package:lpk_ihmi_mobile/send_feedback.dart';
import 'package:lpk_ihmi_mobile/settings.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dasboard;

  @override
  Widget build(BuildContext context) {
    final _box = GetStorage();
    // ignore: prefer_typing_uninitialized_variables
    var container;
    if (currentPage == DrawerSections.dasboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.contacts) {
      container = ContactsPage();
    } else if (currentPage == DrawerSections.events) {
      container = const EventsPage();
    } else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = SendFeedbackPage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: const Text(
          "LPK IHMI CIREBON MOBILE",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                myDrawerList(_box),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future logout() async {
    String url = "$apiUrl/api/logout";
    final _box = GetStorage();

    var token = _box.read("login");

    // setHeader() =>
    //     {'Content-type': 'application/json', 'accept': 'application/json'};

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"Authorization": "Bearer $token"},
      );
      // emailController.value.clear();
      // passwordController.value.clear();
      // box.remove(userToken);

      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        _box.remove("login");
        Get.offAll(const LoginPage(title: "Login"));

        return responseJson;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e);
    }

    //   try {
    //     var response = await http.post(Uri.parse(url),
    //         body: json.encode(data), headers: setHeader());

    //     // ignore: avoid_print
    //     print(response.body);
    //     if (response.statusCode == 200) {
    //       var msg = jsonDecode(response.body);

    //       //data baru
    //       final token = msg['token'];

    //       _box.remove('login');

    //       await prefs.setString('token', token);
    //       //data baru

    //       if (msg['loginStatus'] == true) {
    //         setState(() {
    //           _visible = false;
    //         });

    //         var userInfo = msg['userInfo'];
    //         if (userInfo != null) {
    //           // ignore: unused_local_variable
    //           var userName = userInfo['nama'];

    //           Future.delayed(Duration.zero, () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (context) => const HomePage(title: "halo"),
    //               ),
    //             );
    //           });
    //         } else {
    //           showMessage("Invalid user information");
    //         }
    //       } else {
    //         setState(() {
    //           _visible = false;
    //           showMessage(msg["message"]);
    //         });
    //       }
    //     } else {
    //       setState(() {
    //         _visible = false;
    //         showMessage(
    //             "Error during connecting to Server. Status Code: ${response.statusCode}");
    //       });
    //     }
    //   } catch (e) {
    //     // ignore: avoid_print
    //     print('Error: $e'); // Print the error for debugging
    //     setState(() {
    //       _visible = false;
    //       showMessage("Error during connecting to Server: $e");
    //     });
    //   }
  }

  myDrawerList(GetStorage box) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "Home", Icons.home_outlined,
              currentPage == DrawerSections.dasboard ? true : false),

          menuItem(2, "Halaman Informasi", Icons.info_outlined,
              currentPage == DrawerSections.contacts ? true : false),

          menuItem(3, "Halaman Daftar Peserta", Icons.people_alt_outlined,
              currentPage == DrawerSections.events ? true : false),

          // menuItem(4, "Notes", Icons.notes,
          //     currentPage == DrawerSections.notes ? true : false),
          // const Divider(),
          // menuItem(5, "Settings", Icons.settings_accessibility_outlined,
          //     currentPage == DrawerSections.settings ? true : false),
          // menuItem(6, "Notifications", Icons.notification_add_outlined,
          //     currentPage == DrawerSections.notifications ? true : false),
          // const Divider(),
          // menuItem(7, "Privacy Policy", Icons.privacy_tip_outlined,
          //     currentPage == DrawerSections.privacy_policy ? true : false),
          // menuItem(8, "Contacts", Icons.feedback_outlined,
          //     currentPage == DrawerSections.send_feedback ? true : false),
          ElevatedButton(
            child: const Text("LOGOUT"),
            onPressed: () {
              logout();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const LoginPage(
              //             title: 'logout',
              //           )),
              // );
            },
          ),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dasboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(children: [
            Expanded(
              child: Icon(
                  // ignore: unnecessary_new
                  icon,
                  size: 20,
                  color: Colors.black),
            ),
            Expanded(
              flex: 1,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dasboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  // ignore: constant_identifier_names
  privacy_policy,
  // ignore: constant_identifier_names
  send_feedback,
}
