import 'package:flutter/material.dart';
import 'package:junction/shared/header.dart';
import 'package:junction/shared/week_card.dart';

class EntriesPage extends StatefulWidget {
  @override
  _EntriesPageState createState() => _EntriesPageState();

  final List<String> items = ["Week 43", "Week 42", "Week 41"];
}

class _EntriesPageState extends State<EntriesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Header(title: "Entries"),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final String title = widget.items?.elementAt(index) ?? "";
              return Container(
                height: 330,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/week',
                        arguments: widget.items.elementAt(index));
                  },
                  child: WeekCard(
                    key: Key(title),
                    title: title,
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
