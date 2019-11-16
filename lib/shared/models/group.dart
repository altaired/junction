import 'package:flutter/material.dart';

class Group {
  String title;
  List<GroupMember> members;

  Group({@required this.title, @required this.members});

  void add(GroupMember member) {
    this.members.add(member);
  }
}

class GroupMember {
  final String name;
  final String email;

  GroupMember({@required this.name, @required this.email});
}
