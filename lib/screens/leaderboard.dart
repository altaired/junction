import 'package:flutter/material.dart';
import 'package:junction/services/data.dart';
import 'package:junction/shared/models/leaderboard.dart';

class LeaderboardPage extends StatefulWidget {
  final List<Leaderboard> leaderboards = DataService.leaderboards;

  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 32.0, left: 0, right: 0, bottom: 8.0),
          child: Center(
            child: Text(
              "Leaderboards",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0, left: 0, right: 0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widget.leaderboards.map((board) {
              return Expanded(
                flex: 1,
                child: InkWell(
                  child: Container(
                    height: 55.0,
                    color: widget.leaderboards[this._selectedIndex].title ==
                            board.title
                        ? Colors.grey
                        : Colors.blue,
                    child: Center(
                      child: Text(board.title),
                    ),
                  ),
                  onTap: () {
                    if (widget.leaderboards[this._selectedIndex].title !=
                        board.title) {
                      _onItemTapped(widget.leaderboards.indexOf(board));
                    }
                  },
                ),
              );
            }).toList(),
          ),
        ),
        Expanded(
          flex: 1,
          child: AnimatedContainer(
            duration: Duration(
              milliseconds: 500,
            ),
            child: Table(
                children: _buildTable(
                    widget.leaderboards.elementAt(this._selectedIndex))),
          ),
        )
      ],
    );
  }

  List<TableRow> _buildTable(Leaderboard l) {
    final List<TableRow> rows = [];
    rows.add(TableRow(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Emissions",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Score",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ));
    l.entries.sort((a, b) => (b.score - a.score).toInt());
    l.entries.forEach((entry) {
      rows.add(TableRow(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(entry.name),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(entry.emission.toString()),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(entry.score.toString()),
            ),
          ),
        ],
      ));
    });
    return rows;
  }

  void _onItemTapped(int index) {
    setState(() {
      this._selectedIndex = index;
    });
  }
}
