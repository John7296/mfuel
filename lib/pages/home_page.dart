//home page

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mfuel/pages/verification_page.dart';
import 'package:mfuel/widgets/topBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  Widget divider = const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEBD8),
      // appBar: AppBar(
      //   backgroundColor: Color(0xFFB8D8C9),
      //   elevation: 0,
      // ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              welComeText: user.email!,
              mainText: 'Home',
              allText: true,
            ),
            divider,
            searchField(),
            divider,
            subSection(),
            divider,
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    stationSection('assests/icons/station_1.png', 'HP', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return VerificationPage();
                          },
                        ),
                      );
                    }),
                    stationSection('assests/icons/station_2.png', 'Essar', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return VerificationPage();
                          },
                        ),
                      );
                    }),
                    stationSection('assests/icons/station_3.png', 'Indian Oil',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return VerificationPage();
                          },
                        ),
                      );
                    }),
                  ],
                ),
                divider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    stationSection('assests/icons/station_4.png', 'Reliance',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return VerificationPage();
                          },
                        ),
                      );
                    }),
                    stationSection('assests/icons/station_5.png', 'Nayara', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return VerificationPage();
                          },
                        ),
                      );
                    }),
                    stationSection('assests/icons/station_6.png', 'BPCL', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return VerificationPage();
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Signed In as : ' + user.email!),
                MaterialButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  color: Colors.deepPurple[200],
                  child: Text('sign out'),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}

Widget searchField() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[600]),
          hintText: "Search Fuel Stations",
          fillColor: Colors.grey[300],
          suffixIcon: InkWell(
            child: Icon(
              Icons.search,
              color: Colors.grey[600],
            ),
            onTap: () {},
          ),
        ),
      ),
    ),
  );
}

Widget subSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xFFD9D9D9),
        ),
        height: 25,
        width: 100,
        child: Center(child: Text("Fast Delivery")),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xFFD9D9D9),
        ),
        height: 25,
        width: 100,
        child: Center(child: Text("Rating")),
      )
    ],
  );
}

Widget stationSection(String image, String name, void Function() buttonAction) {
  return InkWell(
    onTap: buttonAction,
    child: Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Stack(
        children: [
          // Positioned(
          //     top: 0,
          //     // right: 0,
          //     // left: 0,
          //     child: Container(
          //       color: Colors.greenAccent,
          //       // height: 30,
          //       width: 100,
          //     )),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFFD9D9D9),
              ),
              height: 25,
              width: 100,
              child: Center(child: Text(name)),
            ),
          ),
        ],
      ),
    ),
  );
}
