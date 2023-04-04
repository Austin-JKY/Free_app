import 'package:flutter/material.dart';
class Tabprofile extends StatefulWidget {
  const Tabprofile({super.key});

  @override
  State<Tabprofile> createState() => _TabprofileState();
}

class _TabprofileState extends State<Tabprofile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.person),
              text: "About",
            ),
            Tab(
              icon: Icon(Icons.pin_invoke),
              text: "Recent Posts",
            ),
          ]),
          Expanded(
            child: TabBarView(children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
            ]),
          )
        ],
      ),
    );
  }
}
