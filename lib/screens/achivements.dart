import 'package:flutter/cupertino.dart';
import 'package:junction/shared/header.dart';
import 'package:tuple/tuple.dart';

class AchivementsPage extends StatelessWidget {

  static final greenFingers = Tuple2('assets/icons/treePlanterAchivement.png', 'Green Fingers');

  final List<List<Tuple2<String, String>>> achivementsMatrix =
      [
        [greenFingers, greenFingers, greenFingers],
        [greenFingers, greenFingers],
      ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Header(title: "Achivements"),
        Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: achivementsMatrix.map((list) => buildRow(list)).toList(),
            ),
          margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        )
      ],
    );
  }

  Widget buildRow(List<Tuple2<String, String>> row) {

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: row.map((pathAndLabel) => buildAchivement(pathAndLabel.item1, pathAndLabel.item2)).toList(),
            )
    );
  }

  Widget buildAchivement(String path, String label) {
    final image = Image.asset(path);
    return Column(
      children: <Widget>[
          Container(
            child: image,
            constraints: BoxConstraints(maxWidth: 80, maxHeight: 80),
          ),
        SizedBox(height: 5),
        Text(label)
      ],
    );
  }
}
