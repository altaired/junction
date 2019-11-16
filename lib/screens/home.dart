import 'package:flutter/material.dart';
import 'package:junction/shared/week_card.dart';
import 'package:junction/shared/barchartaggragate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  final List<String> items = ["Week 43", "Week 42", "Week 41"];
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                _displayGroupPage(context);
              },
              child: Text("Groups"),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final String title = widget.items?.elementAt(index) ?? "";
                  return Padding(
                    padding: EdgeInsets.all(16),
                    child: WeekCard(
                      key: Key(title),
                      title: title,
                    ),
                  );
                },
                itemCount: widget.items.length,
              ),
            ),
      ]
    ),
      ),
      );
  }

  void _displayGroupPage(BuildContext context) {
    Navigator.pushNamed(context, '/groups');
  }
}
