import 'package:flutter/material.dart';
import 'package:junction/models/group.dart';
import 'package:junction/shared/circle_graph.dart';

class WeekCard extends StatelessWidget {
  final String title;
  List<Group> groups = [new Group(), new Group(), new Group()];

  WeekCard({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> groupColors = groups.map((g) {
      return Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.all(4),
        decoration: new BoxDecoration(
          color: g.getColor(),
          shape: BoxShape.circle,
        ),
      );
    }).toList();

    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black54,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(child: CircleGraph(80, groups)),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: groupColors,
                ),
              ]
            ),
          Container(
            alignment: Alignment.center,
            height: 40,
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black54,
            ),
            child: Text("Carbon dioxide: " + (80 / 3.5).toString(),
            style: TextStyle(fontSize: 10, color: Colors.white)),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Bananas"),
                    Text("1337")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
