import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scube/core/const/color_utils.dart';

class SemiCircleProgress extends StatelessWidget {
  final double value;
  final double size;
  final String unit;

  const SemiCircleProgress({
    super.key,
    required this.value,
    this.size = 100,
    this.unit = '',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size / 1.2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size / 20),
            painter: _ThreeQuarterCirclePainter(value),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (value * 100).toStringAsFixed(2),
                style: TextStyle(
                  fontSize: size * 0.15,
                  fontWeight: FontWeight.w500,
                  color: ColorUtils.black87,
                ),
              ),
              Text(
                unit,
                style: TextStyle(
                  fontSize: size * 0.1,
                  color: ColorUtils.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ThreeQuarterCirclePainter extends CustomPainter {
  final double value;

  _ThreeQuarterCirclePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 12.0;
    final center = Offset(size.width / 2, size.height / 1.1);
    final radius = size.width / 2 - strokeWidth / 2;

    final backgroundPaint = Paint()
      ..color = Colors.blue.shade100
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final foregroundPaint = Paint()
      ..color = ColorUtils.baseColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final startAngle = pi / 1.26;
    final sweepAngle = 3 * pi / 2.1;



    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      backgroundPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle * value,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
