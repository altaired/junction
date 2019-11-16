import 'package:flutter/material.dart';
import 'package:junction/shared/models/leaderboard.dart';

class TableRowText extends StatelessWidget {
  final bool bold;
  final String text;
  final bool alignLeft;

  TableRowText(
      {this.bold = false, @required this.text, @required this.alignLeft});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      alignment: this.alignLeft ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          this.text,
          style:
              this.bold ? TextStyle(fontWeight: FontWeight.bold) : TextStyle(),
        ),
      ),
    );
  }
}

class TableRowBuilder {
  static List<TableRow> build(Leaderboard l) {
    final List<TableRow> rows = [];
    rows.add(TableRow(
      children: <Widget>[
        TableRowText(
          text: "Name",
          alignLeft: true,
          bold: true,
        ),
        TableRowText(
          text: "Emissions",
          alignLeft: true,
          bold: true,
        ),
        TableRowText(
          text: "Score",
          alignLeft: false,
          bold: true,
        ),
      ],
    ));
    l.entries.sort((a, b) => (b.score - a.score).toInt());
    l.entries.forEach((entry) {
      rows.add(TableRow(
        children: <Widget>[
          TableRowText(
            text: entry.name,
            alignLeft: true,
          ),
          TableRowText(
            text: entry.score.toString(),
            alignLeft: true,
          ),
          TableRowText(
            text: entry.score.toString(),
            alignLeft: false,
          ),
        ],
      ));
    });
    return rows;
  }
}
