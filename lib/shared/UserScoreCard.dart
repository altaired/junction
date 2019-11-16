import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserScoreCard extends StatelessWidget {

  String username;
  int score;
  Color color;
  NumberFormat numberFormat;

  UserScoreCard(String username, int score, Color color ){
    this.username = username;
    this.score = score;
    this.color = color;
    this.numberFormat = new NumberFormat("########", "en_US");
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.95,
        child: Card(
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                child: FloatingActionButton(
                    backgroundColor: color,
                    elevation: 0,
                    onPressed: () => {},
                  )
                , constraints: BoxConstraints(maxHeight: 36),
                ),
                Text(
                  username,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  numberFormat.format(score),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
            padding: new EdgeInsets.all(16.0),
          ),
        ));
  }


}
