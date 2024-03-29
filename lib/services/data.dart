import 'package:flutter/material.dart';
import 'package:junction/screens/dashboard.dart';
import 'package:junction/shared/models/group.dart';
import 'package:junction/shared/models/leaderboard.dart';
import 'package:junction/shared/models/user.dart';

class DataService {
  static final User me =
      User(name: "Tomuva Jappalainen", email: "vappa@hoplax.fi");

  static final Leaderboard groupLeaderboard = Leaderboard(
    title: "Group",
    entries: [
      LeaderboardEntry(name: "Simon Persson", score: 34, emission: 34),
      LeaderboardEntry(name: "Alexander Tuoma", score: 38, emission: 38),
    ],
  );

  static final List<Product> products = [
    Product(desc: "Pirkka milk semi skimmed 1 l", amount: 2, emission: 0.9),
    Product(desc: "HK sininen link sausage 580g", amount: 2, emission: 3.6),
    Product(desc: "Pepper red foreign kg", amount: 1, emission: 1.7),
    Product(desc: "Pirkka banaani kg", amount: 1, emission: 0.5),
    Product(desc: "Pirkka omena Gala kg", amount: 1, emission: 0.25),
    Product(desc: "Clementine kg", amount: 1, emission: 0.6),
    Product(desc: "Pirkka whipped cream 2dl", amount: 1, emission: 0.85),
    Product(
        desc: "Oululainen reissumies dark 4pcs/280g",
        amount: 1,
        emission: 0.16),
    Product(desc: "Myllyn Paras macaroni 400g", amount: 1, emission: 0.36),
    Product(desc: "Pirkka free hens egg M10 580g", amount: 2, emission: 0.35),
    Product(desc: "Kulta Katriina coffee 500g fg", amount: 1, emission: 1.15),
    Product(desc: "Valio cottage cheese 200g", amount: 1, emission: 0.4),
    Product(
        desc: "Pirkka Ice lettuce 100g bag Finland 1cl",
        amount: 1,
        emission: 0.05),
    Product(desc: "Pirkka burger 100g", amount: 4, emission: 0.62),
    Product(desc: "Onion Finland kg", amount: 2, emission: 0.1),
  ];

  static final List<Leaderboard> leaderboards = [
    Leaderboard(
      title: "Stockholm",
      entries: [
        LeaderboardEntry(name: "Simon Persson", score: 34, emission: 34),
        LeaderboardEntry(name: "Alexander Tuoma", score: 38, emission: 38),
      ],
    ),
    Leaderboard(
      title: "Sweden",
      entries: [
        LeaderboardEntry(name: "Simon Persson", score: 34, emission: 34),
        LeaderboardEntry(name: "Hampus Weslien", score: 36, emission: 36),
      ],
    ),
    Leaderboard(
      title: "Europe",
      entries: [
        LeaderboardEntry(name: "Karl-Oskar Rikas", score: 25, emission: 25),
        LeaderboardEntry(name: "Simon Persson", score: 34, emission: 34),
      ],
    ),
  ];

  static final List<Group> groups = [
    Group(
        "Junction Team",
        [
          GroupMember(name: "Simon Persson", email: "simon@akep.se"),
          GroupMember(name: "Alexander Tuoma", email: "tuoma@kth.se"),
          GroupMember(name: "Hampus Weslien", email: "hampus@lth.se"),
          GroupMember(name: "Karl-Oskar Rikas", email: "ko@lth.se")
        ],
        Colors.deepPurple,
        90.0),
    Group(
        "Hack Team",
        [
          GroupMember(name: "Simon Persson", email: "simon@akep.se"),
          GroupMember(name: "Alexander Tuoma", email: "tuoma@kth.se"),
          GroupMember(name: "Hampus Weslien", email: "hampus@lth.se"),
          GroupMember(name: "Karl-Oskar Rikas", email: "ko@lth.se")
        ],
        Colors.deepOrange,
        100.0),
    Group(
        "Gym Team",
        [
          GroupMember(name: "Simon Persson", email: "simon@akep.se"),
          GroupMember(name: "Alexander Tuoma", email: "tuoma@kth.se"),
          GroupMember(name: "Hampus Weslien", email: "hampus@lth.se"),
          GroupMember(name: "Karl-Oskar Rikas", email: "ko@lth.se")
        ],
        Colors.orange,
        120.0),
  ];

  static final List<Color> colors = [
    Colors.orange,
    Colors.deepPurple,
    Colors.deepOrange
  ];

  static List<List<Group>> weeks() {
    List<List<Group>> result = [];
    for (int i = 0; i < 3; i++) {
      result.add(groups.map((g) {
        return Group(g.title, g.members, g.color, Group.genAvgFootprint());
      }).toList());
    }
    return result;
  }
}
