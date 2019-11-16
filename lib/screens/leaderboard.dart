import 'package:flutter/material.dart';
import 'package:junction/services/data.dart';
import 'package:junction/shared/models/leaderboard.dart';
import 'package:junction/shared/table_row_text.dart';

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
                children: TableRowBuilder.build(
                    widget.leaderboards.elementAt(this._selectedIndex))),
          ),
        )
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      this._selectedIndex = index;
    });
  }
}
