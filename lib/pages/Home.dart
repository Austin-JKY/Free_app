import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Login.dart';
import 'package:flutter_application_1/utils/Fuction.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Email Address: "),
            Text(user?.phoneNumber ?? ""),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Email Address: "),
            Text(user?.email ?? ""),
          ],
        ),
        ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut().then((value) => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()))
                  });
            },
            child: Text("Sing Out"))
      ]),
    );
  }
}
