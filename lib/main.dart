import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junction/screens/create_group.dart';
import 'package:junction/screens/group.dart';
import 'package:junction/screens/start.dart';

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
        '/': (context) => StartPage(),
        '/create-group': (context) => CreateGroup(),
        '/group': (context) => GroupPage(),
      },
    );
  }
}
