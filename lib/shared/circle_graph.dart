import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'circle_widget.dart';

class CircleGraph extends StatelessWidget {
  final int refFootprint;
  final int myFootprint;

  CircleGraph({this.refFootprint = 100, this.myFootprint = 150});

  @override
  Widget build(BuildContext context) {
    final myColor = myFootprint > refFootprint ? Colors.red : Colors.green;
    final refColor = Colors.orange;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 30,
              height: 30,
              decoration: new BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.circle,
              ),
            ),
            Text(myFootprint.toString(), style: TextStyle(fontSize: 10, color: Colors.white)),
          ],
        ),
        CircleWidget(size: myFootprint.toDouble(), color: myColor),
        CircleWidget(size: refFootprint.toDouble(), color: refColor),
      ],
    );
  }
}
