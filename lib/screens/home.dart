import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  final List<String> items = ["Hej"];
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16, left: 16, right: 16),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Week 1",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Container(
                        height: 200,
                        child: Placeholder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
