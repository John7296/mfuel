import 'package:flutter/material.dart';
import 'package:mfuel/pages/home_page.dart';
import 'package:mfuel/pages/verification_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedindex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedindex = index;
            });
            // pageChanged(index);
          },
          children: [
            HomePage(),
            VerificationPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF77BA9A),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        currentIndex: selectedindex,
        onTap: selectedPage,
        items: [
          BottomNavigationBarItem(
              icon: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xFFEEEBD8),
                  child: Icon(
                    Icons.home_rounded,
                    color: Color(0xFF77BA9A),
                  )),
              // ImageIcon(
              //   AssetImage("assests/icons/icon_home.png"),
              //   size: 30,
              //   color: Colors.greenAccent,
              // ),
              label: ""),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xFFEEEBD8),
                  child: Icon(Icons.person, color: Color(0xFF77BA9A))),
              label: ""),
        ],
        selectedFontSize: 2,
        unselectedFontSize: 2,
      ),
    );
  }

  void selectedPage(int index) {
    setState(() {
      selectedindex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
