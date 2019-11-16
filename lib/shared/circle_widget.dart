import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CircleWidget extends StatelessWidget {
  final double size;
  final Color color;

  CircleWidget({this.size = 150, this.color = Colors.orange});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedCirclePainter(color),
      size: new Size(size, size),
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  Color color;

  DashedCirclePainter(this.color) {
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    final double radius = min(size.width, size.height) / 2;
    final int dashes = (radius / 1.5).toInt();
    final double gap = (pi / 180) * 2;
    final double singleAngle = (pi * 2) / dashes;

    for (int i = 0; i < dashes; i++) {
      canvas.drawArc(
          new Rect.fromPoints(Offset.zero, new Offset(radius * 2, radius * 2)),
          gap + singleAngle * i, singleAngle - gap * 2, false, paint
      );
    }
  }

  @override
  bool shouldRepaint(DashedCirclePainter oldDelegate) {
    return false;
  }
}
