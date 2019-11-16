import 'package:flutter/material.dart';

class Leaderboard {
  final String title;
  final List<LeaderboardEntry> entries;

  Leaderboard({@required this.title, @required this.entries});
}

class LeaderboardEntry {
  final String name;
  final double score;
  final double emission;

  LeaderboardEntry(
      {@required this.name, @required this.score, @required this.emission});
}
