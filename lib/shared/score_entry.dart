import 'package:flutter/material.dart';

class ScoreEntry {
  final int pos;
  final String title;
  final int emission;
  final int score;

  ScoreEntry(
      {@required this.pos,
      @required this.title,
      @required this.emission,
      @required this.score});

  TableRow asTableRow(Color textColor, double textSize) {
    return TableRow(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            this.pos.toString(),
            style: TextStyle(fontSize: textSize),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            this.title,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: textSize),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            this.emission.toString(),
            style: TextStyle(
              color: textColor,
              fontSize: textSize,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            this.score.toString(),
            style: TextStyle(
              color: textColor,
              fontSize: textSize,
            ),
          ),
        ),
      ],
    );
  }
}
