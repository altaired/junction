import 'dart:math';

import 'package:flutter/material.dart';
import 'package:junction/services/data.dart';
import 'package:junction/shared/circle_graph.dart';

import 'models/group.dart';

class WeekCard extends StatelessWidget {
  final String title;
  List<Group> groups;

  WeekCard({Key key, @required this.title, @required List<Group> this.groups})
      : super(key: key);

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
          child: Center(
            child: Text(g.getAvgFootprint().toInt().toString(),
                style: TextStyle(fontSize: 10, color: Colors.white)),
          ));
    }).toList();

    Random rng = new Random();
    int myEmission = (rng.nextInt(8) * 10) + 50;

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
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
              Center(child: CircleGraph(myEmission, groups)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: groupColors,
              ),
            ],
          ),
          Container(
            height: 20,
          ),
          Expanded(
            child: Table(
                children: DataService.products
                    .take(3)
                    .map(
                      (p) => TableRow(
                          children: [
                        Text(p.desc.substring(0, 8)),
                        Text(p.emission.toString()),
                      ]
                              .map((w) => Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 4,
                                    ),
                                    child: w,
                                  ))
                              .toList()),
                    )
                    .toList()),
          )
        ],
      ),
    );
  }
}
