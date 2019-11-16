import 'package:junction/shared/models/group.dart';
import 'package:junction/shared/models/user.dart';

class DataService {
  static final User me =
      User(name: "Tomuva Jappalainen", email: "vappa@hoplax.fi");

  static final List<Group> groups = [
    Group(title: "Junction Team", members: [
      GroupMember(name: "Simon Persson", email: "simon@akep.se"),
      GroupMember(name: "Alexander Tuoma", email: "tuoma@kth.se"),
      GroupMember(name: "Hampus Weslien", email: "hampus@lth.se"),
      GroupMember(name: "Karl-Oskar Rikas", email: "ko@lth.se")
    ])
  ];
}
