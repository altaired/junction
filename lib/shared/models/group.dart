import 'package:flutter/material.dart';

class Group {
  String title;
  List<String> members;

  Group({@required this.title, @required this.members});

  void add(String member) {
    this.members.add(member);
  }
}
