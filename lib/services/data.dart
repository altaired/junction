import 'package:junction/shared/models/group.dart';
import 'package:junction/shared/models/leaderboard.dart';
import 'package:junction/shared/models/user.dart';

class DataService {
  static final User me =
      User(name: "Tomuva Jappalainen", email: "vappa@hoplax.fi");

  static final List<Leaderboard> leaderboards = [
    Leaderboard(
      title: "Stockholm",
      entries: [
        LeaderboardEntry(name: "Simon Persson", score: 20012, emission: 2002),
        LeaderboardEntry(name: "Alexander Tuoma", score: 20011, emission: 2001),
      ],
    ),
    Leaderboard(
      title: "Sweden",
      entries: [
        LeaderboardEntry(name: "Simon Persson", score: 20012, emission: 2002),
        LeaderboardEntry(name: "Hampus Weslien", score: 20011, emission: 2001),
      ],
    ),
    Leaderboard(
      title: "Europe",
      entries: [
        LeaderboardEntry(name: "Simon Persson", score: 20012, emission: 2002),
        LeaderboardEntry(
            name: "Karl-Oskar Rikas", score: 20011, emission: 2001),
      ],
    ),
  ];

  static final List<Group> groups = [
    Group(title: "Junction Team", members: [
      GroupMember(name: "Simon Persson", email: "simon@akep.se"),
      GroupMember(name: "Alexander Tuoma", email: "tuoma@kth.se"),
      GroupMember(name: "Hampus Weslien", email: "hampus@lth.se"),
      GroupMember(name: "Karl-Oskar Rikas", email: "ko@lth.se")
    ])
  ];
}
