import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Home.dart';
import 'package:flutter_application_1/pages/Nav.dart';
import 'package:flutter_application_1/pages/Register.dart';
import 'package:flutter_application_1/utils/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/PaingBackground.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    TextEditingController _phoneedittext = TextEditingController();
    TextEditingController _passwordedittext = TextEditingController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Stack(children: [
              CustomPaint(
                painter: Triangle(size),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: Text(
                      "Hello" + "\nWelcome!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          child: Column(children: [
                            TextFormField(
                              controller: _phoneedittext,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  labelText: "Email or Phone Number"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _passwordedittext,
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: "Passowrd"),
                            ),
                            Container(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: Text("Forget Password"))
                                  ]),
                            ),
                            Container(
                              width: 200,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    backgroundColor: blue),
                                onPressed: () async {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: _phoneedittext.text,
                                          password: _passwordedittext.text)
                                      .then((value) {
                                    print("Log in successful");
                                    Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Nav()))
                                        .onError((error, stackTrace) {
                                      print("ERROR");
                                    });
                                  });
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("LOGIN",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ]),
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("New here?"),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Register()));
                                      },
                                      child: Text("Create an account",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)))
                                ],
                              ),
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
