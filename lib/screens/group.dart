import 'package:flutter/material.dart';
import 'package:junction/services/data.dart';
import 'package:junction/shared/header.dart';
import 'package:junction/shared/models/group.dart';
import 'package:junction/shared/models/leaderboard.dart';
import 'package:junction/shared/table_row_text.dart';

class GroupPage extends StatelessWidget {
  final Color textColor = Colors.black;
  final double textSize = 16.0;
  final Leaderboard board = DataService.groupLeaderboard;

  @override
  Widget build(BuildContext context) {
    final Group group = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Header(title: group.title),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Table(
              children: LeaderboardRowBuilder.build(board),
            ),
          )),
        ],
      ),
    );
  }
}
