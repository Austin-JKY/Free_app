import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/PaingBackground.dart';

class Flash extends StatelessWidget {
  const Flash({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              CustomPaint(
                painter: Flashscreen(size),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      "Data",
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    Image.asset("assets/images/tauruss.png"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
