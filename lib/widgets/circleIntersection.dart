import 'package:flutter/material.dart';

class CircleIntersection extends StatelessWidget {
  const CircleIntersection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double circleRadius = 100;

    return SizedBox(
      width: circleRadius * 2,
      height: circleRadius * 1.5,
      child: Stack(
        children: [
          Positioned(
            top: -circleRadius * .5,
            left: -circleRadius,
            child: Container(
              height: 100 * 2,
              width: 100 * 2,
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                color: Color(0xFFB8D8C9).withOpacity(.5),
              ),
            ),
          ),
          Positioned(
            top: -circleRadius,
            child: Container(
              height: 100 * 2,
              width: 100 * 2,
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                color: Color(0xFFB8D8C9).withOpacity(.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
