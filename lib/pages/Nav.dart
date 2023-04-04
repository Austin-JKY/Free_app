import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Createpost.dart';
import 'package:flutter_application_1/utils/PaingBackground.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import '../utils/constant.dart';
import 'Home.dart';
import 'Profile.dart';
import 'Save.dart';
import 'Search.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int currentIndex = 0;

  late Home home;

  late Search search;

  late Save save;

  late Profile profile;

  late List<Widget> pages;

  late Widget currentpage;

  @override
  void initState() {
    home = Home();
    save = Save();
    profile = Profile();
    search = Search();
    pages = [home, save, search, profile];

    currentpage = home;
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   bottomNavigationBar: BottomNavigationBar(
    //       onTap: ((int index) {
    //         setState(() {
    //           currentIndex = index;
    //           currentpage = pages[index];
    //         });
    //       }),
    //       currentIndex: currentIndex,
    //       type: BottomNavigationBarType.fixed,
    //       fixedColor: green,
    //       items: [
    //         BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.home,
    //           ),
    //           label: "Home",
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.search,
    //           ),
    //           label: "Orders",
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.save,
    //           ),
    //           label: "Save",
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.person,
    //           ),
    //           label: "Profile",
    //         ),
    //       ]),
    // );
    // ;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: SlidingClippedNavBar.colorful(
          backgroundColor: Colors.white,
          onButtonPressed: (int index) {
            setState(() {
              currentIndex = index;
              currentpage = pages[index];
            });
          },
          iconSize: 25,
          selectedIndex: currentIndex,
          barItems: [
            BarItem(
              icon: Icons.home_outlined,
              title: 'Explore',
              activeColor: green,
              inactiveColor: black,
            ),
            BarItem(
              icon: Icons.chat_bubble_outline,
              title: 'Search',
              activeColor: green,
              inactiveColor: black,
            ),
            BarItem(
              icon: Icons.save_alt_outlined,
              title: 'Search',
              activeColor: green,
              inactiveColor: black,
            ),
            BarItem(
              icon: Icons.person_outline,
              title: 'Search',
              activeColor: green,
              inactiveColor: black,
            ),

            /// Add more BarItem if you want
          ],
        ),
      ),
      body: currentpage,
      floatingActionButton: FloatingActionButton(
        backgroundColor: m4,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => Createpost())));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
