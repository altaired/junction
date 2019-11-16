import 'package:flutter/material.dart';

class WeekCard extends StatelessWidget {
  final String title;

  WeekCard({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
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
                  ),
                ),
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
