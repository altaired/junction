import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CircleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: DashedCirclePainter(75, Colors.orange),
    );
  }

}

class DashedCirclePainter extends CustomPainter {
  Offset size;
  int dashes;
  Color color;
  final double strokeWidth = 4.0;

  DashedCirclePainter(double radius, this.color) {
    this.size = new Offset(radius * 2, radius * 2);
    this.dashes = (radius / 1.5).toInt();
    this.color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    final double gap = pi / 180 * 2;
    final double singleAngle = (pi * 2) / dashes;


    for (int i = 0; i < dashes; i++) {
      canvas.drawArc(
          new Rect.fromPoints(Offset.zero, new Offset(150, 150)),
          gap + singleAngle * i, singleAngle - gap * 2, false, paint
      );
    }
  }

  @override
  bool shouldRepaint(DashedCirclePainter oldDelegate) {
    return false;
  }
}
