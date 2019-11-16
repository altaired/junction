import 'package:flutter/material.dart';
import 'package:junction/screens/achivements.dart';
import 'package:junction/screens/dashboard.dart';
import 'package:junction/screens/home.dart';
import 'package:junction/screens/groups.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final Color unselectedItemColor = Color.fromARGB(100, 74, 74, 74);
  final Color selectedItemColor = Colors.black;

  final List<Widget> _widgets = [
    HomePage(),
    GroupsPage(),
    DashboardPage(),
    AchivementsPage(),
  ];

  final double iconSize = 34.0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: this.selectedItemColor,
        unselectedItemColor: this.unselectedItemColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              size: this.iconSize,
            ),
            title: Text('Entries'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              size: this.iconSize,
            ),
            title: Text('Groups'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.data_usage,
              size: this.iconSize,
            ),
            title: Text('Stats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              size: this.iconSize,
            ),
            title: Text('Achivements'),
          ),
        ],
      ),
      body: AnimatedContainer(
        child: _widgets.elementAt(_selectedIndex),
        duration: Duration(milliseconds: 500),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
