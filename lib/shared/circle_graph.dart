import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:junction/models/group.dart';

import 'circle_widget.dart';

class CircleGraph extends StatelessWidget {
  int myFootprint;
  List<Group> groups;

  CircleGraph(int myFoorprint, List<Group> groups) {
    this.myFootprint = myFoorprint;
    this.groups = groups;
  }

  @override
  Widget build(BuildContext context) {
    final myColor =
      groups
          .map((g) => g.getAvgFootprint())
          .where((fp) => fp < myFootprint).length != 0
          ? Colors.red
          : Colors.green;

    List<Widget> refCircles =
      groups
          .map((g) => CircleWidget(size: g.getAvgFootprint(), color: g.getColor()))
          .toList();

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: myFootprint.toDouble(),
              height: myFootprint.toDouble(),
              decoration: new BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.circle,
              ),
            ),
            Text(myFootprint.toString(), style: TextStyle(fontSize: 12, color: Colors.white)),
          ],
        ),
        ...refCircles,
      ],
    );
  }
}
