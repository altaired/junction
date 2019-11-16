import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junction/screens/home.dart';
import 'package:junction/screens/dashboard.dart';
import 'package:junction/screens/friends.dart';
import 'package:junction/screens/profile.dart';
import 'package:junction/screens/aggragate.dart';

void main() => runApp(Junction());

class Junction extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/friends': (context) => FriendsPage(),
        '/dash': (context) => DashboardPage(),
        '/aggragate': (context) => AggragatePage(),
      },
    );
  }
}
