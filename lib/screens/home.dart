import 'package:flutter/material.dart';
import 'package:junction/shared/header.dart';
import 'package:junction/shared/week_card.dart';
import 'package:junction/shared/bar_chart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  final List<String> items = ["Week 43", "Week 42", "Week 41"];
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Header(title: "Home"),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final String title = widget.items?.elementAt(index) ?? "";
              return Container(
                height: 250,
                child: WeekCard(
                  key: Key(title),
                  title: title,
                ),
              );
            },
            itemCount: widget.items.length,
          ),
        ),
      ],
    );
  }
}
