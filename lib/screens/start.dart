import 'package:flutter/material.dart';
import 'package:junction/screens/achivements.dart';
import 'package:junction/screens/dashboard.dart';
import 'package:junction/screens/entries.dart';
import 'package:junction/screens/groups.dart';
import 'package:junction/screens/leaderboard.dart';
import 'package:junction/shared/color_palatte.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:junction/shared/icons/my_flutter_app_icons.dart';

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
    LeaderboardPage(),
  ];

  final Widget achivementIcon = new SvgPicture.asset('assets/icons/trophy.svg',
      color: ColorPalatte.blueLilac, semanticsLabel: 'a purple trophy');

  final double iconSize = 34.0;
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalatte.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: this.selectedItemColor,
        unselectedItemColor: this.unselectedItemColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
              MyFlutterApp.trophy,
              size: this.iconSize,
            ),
            title: Text('Achivements'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              size: this.iconSize,
            ),
            title: Text('Leaderboards'),
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
      this._selectedIndex = index;
    });
  }
}
