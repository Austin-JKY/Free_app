import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Create%20account2.dart';
import 'package:flutter_application_1/utils/Fuction.dart';
import 'package:flutter_application_1/utils/PaingBackground.dart';
import 'package:flutter_application_1/utils/constant.dart';

class Createaccount extends StatefulWidget {
  const Createaccount({super.key});

  @override
  State<Createaccount> createState() => _CreateaccountState();
}

class _CreateaccountState extends State<Createaccount> {
  bool loading = false;
  var phoneNumber = "";

  void sendOtpcode() {
    loading = true;
    setState(() {});
    final _auth = FirebaseAuth.instance;

    if (phoneNumber.isNotEmpty) {
      authWithPhoneNumber(phoneNumber, onCodeSend: (verificationId, v) {
        loading = false;
        setState(() {});
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Createaccount2(
                      verificationId: verificationId,
                      phoneNumber: phoneNumber,
                    )));
      }, onAutoVerify: (v) async {
        await _auth.signInWithCredential(v);
      }, onFailed: (e) {
        print("failed");
      }, autoRetrieval: (v) {});
    }
  }

  TextEditingController countrycode = TextEditingController();

  void initState() {
    countrycode.text = "+95";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
                        height: 40,
                      ),
                      Text("Enter Your Phone number"),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(children: [
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 35,
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              controller: countrycode,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Text("|",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.grey)),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: TextField(
                            onChanged: (value) {
                              print(value);
                              phoneNumber = "${countrycode.text + value}";
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "phone number"),
                          ))
                        ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: 300,
                          margin: EdgeInsets.only(left: 20),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: loading ? null : sendOtpcode,
                              child: loading
                                  ? const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                          Color(0xff0A4474)),
                                    )
                                  : const Text("Send OTP Code")))
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
    ;
  }
}
