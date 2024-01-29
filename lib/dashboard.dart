import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        height: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/images/lpk_ihmi.png'),
          ),
        ),
      // child: const Center(
      //   child: Text("Dashboard Page")),
    );
  }
}
