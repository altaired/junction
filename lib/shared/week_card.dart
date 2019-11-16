import 'package:flutter/material.dart';
import 'package:junction/shared/circle_graph.dart';
import 'package:junction/shared/circle_widget.dart';

class WeekCard extends StatelessWidget {
  final String title;

  WeekCard({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black54,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              this.title,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(child: CircleGraph())
            ),
          ),
        ],
      ),
    );
  }
}
