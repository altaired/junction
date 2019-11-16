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
        child: Center(child:
            Text(g.getAvgFootprint().toInt().toString(),
              style: TextStyle(fontSize: 10, color: Colors.white)),
        )
      );
    }).toList();

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
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
            height: 20,
          ),
          Expanded(
            child: Table(
              children: [
                TableRow(
                  children: <Widget>[
                    Text("Bananas"),
                    Text("1337")
                  ].map((w) => Padding(padding: EdgeInsets.symmetric(horizontal: 40, vertical: 4), child: w)).toList(),
                ),
                TableRow(
                  children: <Widget>[
                    Text("Bananas"),
                    Text("1337")
                  ].map((w) => Padding(padding: EdgeInsets.symmetric(horizontal: 40, vertical: 4), child: w)).toList(),
                ),
                TableRow(
                  children: <Widget>[
                    Text("Red Bull"),
                    Text("99")
                  ].map((w) => Padding(padding: EdgeInsets.symmetric(horizontal: 40, vertical: 4), child: w)).toList(),
                ),
              ],
            ),
            )
        ],
      ),
    );
  }
}
