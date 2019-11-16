import 'package:flutter/material.dart';

class LearderboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.golf_course),
              ),
              Tab(
                icon: Icon(Icons.gamepad),
              ),
            ],
          ),
          TabBarView(
            children: <Widget>[
              Container(
                color: Colors.green,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.yellow,
                width: 100,
                height: 100,
              ),
            ],
          )
        ],
      ),
    );
  }
}
