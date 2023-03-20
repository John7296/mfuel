import 'package:flutter/material.dart';

import 'circleIntersection.dart';

class TopBar extends StatelessWidget {
  TopBar({required this.welComeText, required this.mainText, required this.allText});

  final String welComeText;
  final String mainText;
  bool allText  = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              child: Container(
                height: 200,
                width: double.infinity,
                color: const Color(0xFF77BA9A),
                child: const CircleIntersection(),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 5),
                child: SizedBox(
                  height: 100,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        mainText,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        allText?'Welcome: ' + welComeText:'',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      allText? InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Color(0xFFD9D9D9),
                          ),
                          child: Center(
                              child: Text(
                            "Today's Fuel Cost: ₹105",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ),
                      ):SizedBox()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
