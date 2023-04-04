import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Create%20account.dart';
import 'package:flutter_application_1/utils/PaingBackground.dart';
import 'package:flutter_application_1/utils/constant.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool loading = false;
  TextEditingController _phoneedittext = TextEditingController();
  TextEditingController _passwordedittext = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();

  RegExp regpassword = RegExp("(?=.*?[A-Z])");

  bool validatePassword(String value) {
    String password = value.trim();

    if (regpassword.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  void nextbtn() {
    loading = true;
    setState(() {});
    if (_formkey.currentState!.validate()) {
      loading = true;
      setState(() {});
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _phoneedittext.text, password: _passwordedittext.text)
          .then((value) {
        print("Creage new account");
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => Createaccount()))
            .onError((error, stackTrace) {
          print("error");
        });
      });
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Stack(
              children: [
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
                      height: 150,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create New Email Address",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          Form(
                            key: _formkey,
                            child: Container(
                              margin: EdgeInsets.only(top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 300,
                                        child: TextField(
                                          controller: _phoneedittext,
                                          decoration: InputDecoration(
                                              labelText: "Email Address"),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          width: 300,
                                          child: TextFormField(
                                            controller: _passwordedittext,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                loading = false;
                                                setState(() {});
                                                return "Please enter password";
                                              } else {
                                                bool result =
                                                    validatePassword(value);
                                                if (result) {
                                                  return null;
                                                } else {
                                                  loading = false;
                                                  setState(() {});
                                                  return "please should contain Capital Letter";
                                                }
                                              }
                                            },
                                            decoration: InputDecoration(
                                                labelText: "Password"),
                                          )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 300,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: blue,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 5)),
                                            onPressed: loading ? null : nextbtn,
                                            child: loading
                                                ? const CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation(
                                                            Color(0xff0A4474)),
                                                  )
                                                : const Text(
                                                    "Next",
                                                  )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
