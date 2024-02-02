import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
// class DashboardPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // ignore: avoid_unnecessary_containers
//     return Container(
//       child: const Center(child: Text("Dashboard Page")),
//     );
//   }
// }

// ignore: use_key_in_widget_constructors
class DashboardPage extends StatelessWidget {
  get child => null;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
        // ignore: avoid_unnecessary_containers
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 1,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/lpkihmi.jpg'),
                fit: BoxFit.cover,),
                ),
                //child: const Text("He'd have you all unravel at the"),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/1.png'),
                fit: BoxFit.cover,),
                ),
                //child: const Text("He'd have you all unravel at the"),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/2.png'),
                fit: BoxFit.cover,),
                ),
                //child: const Text("He'd have you all unravel at the"),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/3.png'),
                fit: BoxFit.cover,),
                ),
                
                //child: const Text("He'd have you all unravel at the"),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/4.png'),
                fit: BoxFit.cover,),
                ),
                //child: const Text("He'd have you all unravel at the"),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/5.png'),
                fit: BoxFit.cover,),
                ),
                //child: const Text("He'd have you all unravel at the"),
            ),
          ],
        ));
  }
}
