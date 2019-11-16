import 'package:flutter/material.dart';
import 'package:junction/screens/achivements.dart';
import 'package:junction/screens/dashboard.dart';
import 'package:junction/screens/entries.dart';
import 'package:junction/screens/groups.dart';
import 'package:junction/shared/ColorPalatte.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final Color unselectedItemColor = ColorPalatte.blueLilac.withOpacity(0.5);
  final Color selectedItemColor = ColorPalatte.blueLilac;

  final List<Widget> _widgets = [
    EntriesPage(),
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
      backgroundColor: ColorPalatte.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: this.selectedItemColor,
        unselectedItemColor: this.unselectedItemColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Color.,
        type: BottomNavigationBarType.fixed,
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
