import 'package:flutter/material.dart';
import 'package:junction/shared/header.dart';
import 'package:junction/shared/models/group.dart';
import 'package:junction/shared/score_entry.dart';

class GroupPage extends StatelessWidget {
  final Color textColor = Color.fromARGB(100, 74, 74, 74);
  final double textSize = 16.0;

  final List<ScoreEntry> data = [
    ScoreEntry(pos: 1, title: "Simon", emission: 100, score: 10000),
    ScoreEntry(pos: 2, title: "Karl-Oskar", emission: 99, score: 9999),
  ];

  @override
  Widget build(BuildContext context) {
    final Group group = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Header(title: group.title),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Table(
              children: this.data.map((o) {
                return o.asTableRow(this.textColor, this.textSize);
              }).toList(),
            ),
          )),
        ],
      ),
    );
  }
}
