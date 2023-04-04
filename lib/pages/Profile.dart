import 'package:flutter/material.dart';
import '../utils/constant.dart';
import 'Profilelistui.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      child: Stack(children: [
        ClipPath(
          child: Container(
            height: 380,
            color: green,
          ),
          clipper: Mycustom(),
        ),
        ClipPath(
          child: Container(
            height: 380,
            color: m4,
          ),
          clipper: Mycustom2(),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: m2,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                          color: m2, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.edit,
                      color: m2,
                    ),
                  ]),
              SizedBox(
                height: 20,
              ),
              ClipOval(
                child: Image.asset(
                  "assets/images/pp.jpg",
                  width: 110,
                  height: 110,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "William Aiden",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "When your business needs a new direction – we are here to serve you.",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              TabBar(controller: _tabController, tabs: [
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
                child: TabBarView(controller: _tabController, children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: SingleChildScrollView(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Account",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: m4,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                "+959976785743",
                                style: TextStyle(color: m6),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Tab to change phone number",
                                style: TextStyle(color: m6, fontSize: 10),
                              ),
                              Divider(
                                color: m6,
                                thickness: 0.2,
                              ),
                              Text(
                                "FEDEX COMPANY",
                                style: TextStyle(color: m6),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Username",
                                style: TextStyle(color: m6, fontSize: 10),
                              ),
                              Divider(
                                color: m6,
                                thickness: 0.2,
                              ),
                              Text(
                                "+959976785743",
                                style: TextStyle(color: m6),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Tab to change phone number",
                                style: TextStyle(color: m6, fontSize: 10),
                              ),
                              Divider(
                                color: m6,
                                thickness: 0.2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                              itemCount: 4,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 310,
                                crossAxisSpacing: 2,
                              ),
                              itemBuilder: ((context, index) {
                                return Profilelistui();
                              })),
                        )
                      ],
                    ),
                  ),
                ]),
              )
            ],
          ),
        )
      ]),
    ));
  }
}

class Mycustom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 1.7, 0);
    path.lineTo(0, size.width * 3.2);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Mycustom2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(240, 0);
    path.lineTo(size.width * 2, 0);
    path.lineTo(size.width / 7, size.width * 2);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
