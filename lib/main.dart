import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Login.dart';
import 'package:flutter_application_1/pages/Nav.dart';
import 'pages/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final _auth = FirebaseAuth.instance;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    // home: StreamBuilder<User?>(
    //   stream: _auth.authStateChanges(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       return Home();
    //     } else {
    //       return Login();
    //     }
    //   },
    // )
    home: Nav(),
  ));
}
