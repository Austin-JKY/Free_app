import 'package:flutter/material.dart';

import '../utils/constant.dart';

class Profilelistui extends StatefulWidget {
  const Profilelistui({super.key});

  @override
  State<Profilelistui> createState() => _ProfilelistuiState();
}

class _ProfilelistuiState extends State<Profilelistui> {
  bool turnLocation = true;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(right: 5, left: 5, bottom: 5),
        // decoration: BoxDecoration(
        //     color: Colors.white,
        //     boxShadow: [BoxShadow(color: black, blurRadius: 1)]),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipOval(
                      child: Image.asset(
                    "assets/images/pp.jpg",
                    width: 40,
                    height: 40,
                  )),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Aung Myo Khant",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "5h.Processing",
                        style: TextStyle(color: m3, fontSize: 10),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Route",
                style: TextStyle(color: m4, fontSize: 10),
              ),
              Text(
                "ThiriMying to Hlaing",
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(
                height: 8,
              ),
              FittedBox(
                child: Text(
                  "Detail address to be picked up the item",
                  style: TextStyle(color: m4, fontSize: 10),
                ),
              ),
              Text(
                "ThiriMying to Hlaing 100/29 Street",
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(
                height: 8,
              ),
              FittedBox(
                child: Text(
                  "Date to be picked up item",
                  style: TextStyle(color: m4, fontSize: 10),
                ),
              ),
              Text(
                "12/Apirl/2000",
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(
                height: 8,
              ),
              FittedBox(
                child: Text(
                  "Package",
                  style: TextStyle(color: m4, fontSize: 10),
                ),
              ),
              Text(
                "12/Apirl/2000",
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(
                height: 8,
              ),
              FittedBox(
                child: Text(
                  "Package",
                  style: TextStyle(color: m4, fontSize: 10),
                ),
              ),
              Text(
                "12/Apirl/2000",
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 1,
                color: black,
              ),
              FittedBox(
                child: Row(
                  children: [
                    Row(
                      children: [
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.transparent)),
                          onPressed: () {},
                          label: Text(
                            "Request",
                            style: TextStyle(color: m4),
                          ),
                          icon: Icon(
                            Icons.send,
                            size: 25,
                            color: m4,
                          ),
                        ),
                        Switch(
                          activeTrackColor: m7,
                          activeColor: m8,
                          value: turnLocation,
                          onChanged: ((bool value) {
                            setState(() {
                              turnLocation = value;
                            });
                          }),
                        ),
                        Text(
                          "Location",
                          style: TextStyle(color: m4),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
