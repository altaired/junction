import 'package:flutter/material.dart';
import 'package:junction/shared/header.dart';
import 'package:junction/shared/models/group.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  final List<GroupMember> _members = [];
  final TextEditingController _titleController = new TextEditingController();
  final TextEditingController _memberNameController =
      new TextEditingController();
  final TextEditingController _memberEmailController =
      new TextEditingController();
  final FocusNode _titleFocus = FocusNode();
  final FocusNode _memberNameFocus = FocusNode();
  final FocusNode _memberEmailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Header(title: "Create group"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _titleController,
              focusNode: this._titleFocus,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (term) {
                _fieldFocusChange(context, _titleFocus, _memberNameFocus);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Add member"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _memberNameController,
              focusNode: this._memberNameFocus,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (term) {
                _fieldFocusChange(context, _memberNameFocus, _memberEmailFocus);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
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
                  child: TextFormField(
                    controller: _memberEmailController,
                    focusNode: this._memberEmailFocus,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) => this._addMember(),
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
                    onPressed: () => this._addMember(),
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
                    child: Text(this._members.elementAt(index).name ?? ""),
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
                  new Group(title, this._members, Colors.orange, 2.0);
              Navigator.pop(context, group);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  void _addMember() {
    final String name = this._memberNameController.text;
    final String email = this._memberEmailController.text;
    if (name != "" && email != "") {
      setState(() {
        final GroupMember member = GroupMember(name: name, email: email);
        this._members.add(member);
        this._memberNameController.clear();
        this._memberEmailController.clear();
      });
    }
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
