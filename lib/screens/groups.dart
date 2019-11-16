import 'package:flutter/material.dart';
import 'package:junction/services/data.dart';
import 'package:junction/shared/ColorPalatte.dart';
import 'package:junction/shared/header.dart';
import 'package:junction/shared/models/group.dart';

class GroupsPage extends StatefulWidget {
  @override
  _GroupsPageState createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  final List<Group> _groups = DataService.groups;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Header(
          title: "Groups",
        ),
        Expanded(
          child: GridView.builder(
            itemBuilder: (BuildContext context, int index) {
              final Group g = this._groups.elementAt(index);
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/group', arguments: g);
                },
                child: Center(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              g.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(g.members.length.toString() + " members")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: this._groups.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 1.0,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: FloatingActionButton(
              backgroundColor: ColorPalatte.blueLilac,
              child: Icon(Icons.add),
              onPressed: () {
                this._displayCreateGroup();
              },
            ),
          ),
        )
      ],
    );
  }

  void _displayCreateGroup() async {
    final dynamic result = await Navigator.pushNamed(context, '/create-group');
    if (result != null) {
      setState(() {
        this._groups.add(result);
      });
    }
  }
}
