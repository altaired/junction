import 'package:flutter/material.dart';
import 'package:junction/shared/header.dart';
import 'package:junction/shared/models/group.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  final List<String> _members = [];
  final TextEditingController _titleController = new TextEditingController();
  final TextEditingController _memberController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Header(title: "Create group"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: TextField(
                    controller: _memberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'name@example.com',
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        final String member = this._memberController.text;
                        this._members.add(member);
                        this._memberController.clear();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Members",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(this._members?.elementAt(index) ?? "None"),
                  );
                },
                itemCount: this._members.length,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              final String title = this._titleController.text;
              final Group group =
                  new Group(title: title, members: this._members);
              Navigator.pop(context, group);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
