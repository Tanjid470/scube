import 'package:flutter/material.dart';

class ColoredCircle extends StatelessWidget {
  final Color color;
  final double size; // total outer circle size

  const ColoredCircle({super.key, required this.color, this.size = 15});

  @override
  Widget build(BuildContext context) {
    final outerSize = size;
    final innerSize = size * 2 / 3; // inner circle = 2/3 of outer
    final offset = (outerSize - innerSize) / 2;

    return Stack(
      children: [
        Container(
          width: outerSize,
          height: outerSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: color,
              width: outerSize * 0.07, // border proportional to size
            ),
          ),
        ),
        Positioned(
          top: offset,
          left: offset,
          child: Container(
            width: innerSize,
            height: innerSize,
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
