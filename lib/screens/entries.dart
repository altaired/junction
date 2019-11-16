import 'package:flutter/material.dart';
import 'package:junction/services/data.dart';
import 'package:junction/shared/header.dart';
import 'package:junction/shared/models/group.dart';
import 'package:junction/shared/week_card.dart';

class EntriesPage extends StatefulWidget {
  @override
  _EntriesPageState createState() => _EntriesPageState();

  final List<String> items = ["Week 43", "Week 42", "Week 41"];
}

class _EntriesPageState extends State<EntriesPage> {
  final List<List<Group>> weeks = DataService.weeks();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Header(title: "Entries"),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              weeks[index]
                  .sort((a, b) => (a.avgFootprint - b.avgFootprint).toInt());
              List<Group> week = weeks[index];

              final String title = widget.items?.elementAt(index) ?? "";
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 8.0,
                ),
                height: 330,
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/week',
                        arguments: widget.items.elementAt(index));
                  },
                  child: WeekCard(
                    key: Key(title),
                    title: title,
                    groups: weeks[index],
                  ),
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
