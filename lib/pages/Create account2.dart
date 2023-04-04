import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Register.dart';
import 'package:flutter_application_1/utils/Fuction.dart';
import 'package:flutter_application_1/utils/constant.dart';
import '../utils/PaingBackground.dart';

class Createaccount2 extends StatefulWidget {
  const Createaccount2(
      {super.key, required this.verificationId, required this.phoneNumber});
  final String verificationId;
  final phoneNumber;

  @override
  State<Createaccount2> createState() => _Createaccount2State();
}

class _Createaccount2State extends State<Createaccount2> {
  String smsCode = "";
  bool loading = false;
  bool resend = false;
  int count = 20;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    decompte();
    super.initState();
  }

  late Timer timer;

  void decompte() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count < 1) {
        timer.cancel();
        count = 20;
        resend = true;
        setState(() {});
        return;
      }
      count--;
      setState(() {});
    });
  }

  void resendSmsCode() {
    resend = false;
    setState(() {});
    authWithPhoneNumber(widget.phoneNumber, onCodeSend: (verificationId, v) {
      loading = false;
      setState(() {});
      decompte();
      resend = false;
    }, onAutoVerify: (v) async {
      await _auth.signInWithCredential(v);
    }, onFailed: (e) {
      print("failed");
    }, autoRetrieval: (v) {});
  }

  void onverifySmscode() async {
    loading = true;
    setState(() {});
    await validdateOtp(smsCode, widget.verificationId);
    print("try again");
    loading = true;
    setState(() {});

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
    print("Verification successful");
  }

  @override
  Widget build(BuildContext context) {
    print(widget.verificationId);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: SingleChildScrollView(
          child: SafeArea(
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
                          "Create an account",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text("OTP send your registered mobile number"),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                            child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              child: TextField(
                                onChanged: (value) {
                                  smsCode = value;
                                  // setState(() {});
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: "Enter OTP Code",
                                    hintText: "123456"),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 300,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: blue),
                                  onPressed: smsCode.length < 6 || loading
                                      ? null
                                      : onverifySmscode,
                                  child: loading
                                      ? const CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              Color(0xff0A4474)),
                                        )
                                      : const Text("Verify")),
                            ),
                            Container(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("If your don't have OTP click here"),
                                    TextButton(
                                        onPressed:
                                            !resend ? null : resendSmsCode,
                                        child: Text(!resend
                                            ? "00:${count.toString().padLeft(2, "0")}"
                                            : "Resend")),
                                    Text("again")
                                  ]),
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
