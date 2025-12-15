import 'package:flutter/material.dart';

class ColoredCircle extends StatelessWidget {
  final Color color;

  const ColoredCircle({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: color,
              width: 1,
            ),
          ),
        ),
        Positioned(
          top: 2.5,
          left: 2.5,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
