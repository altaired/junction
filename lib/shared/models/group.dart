import 'dart:math';

import 'package:flutter/material.dart';

class Group {
  String title;
  List<GroupMember> members;
  Color color = genColor();
  double avgFootprint = genAvgFootprint();

  Group({@required this.title, @required this.members});

  void add(GroupMember member) {
    this.members.add(member);
  }

  Color getColor() {
    return color;
  }

  double getAvgFootprint() {
    return avgFootprint;
  }

  static Color genColor() {
    Random rng = new Random();
    int i = rng.nextInt(4);
    return [Colors.orange, Colors.deepOrange, Colors.deepPurple, Colors.teal][i];
  }

  static double genAvgFootprint() {
    Random rng = new Random();
    return (rng.nextInt(5) + 10) * 10.0;
  }


}

class GroupMember {
  final String name;
  final String email;

  GroupMember({@required this.name, @required this.email});
}
