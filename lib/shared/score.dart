import 'package:flutter/cupertino.dart';

import 'color_palatte.dart';
import 'icons/my_flutter_app_icons.dart';

class Score extends StatelessWidget {

  final int score;
  final double size;

  Score(this.score, this.size){}

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Icon(
      MyFlutterApp.leaf,
      size: 24 * size,
      color: ColorPalatte.emeraldGreen,
    ),
    Text(
    score.toString(),
    style: TextStyle(
    fontSize: 32.0*size,
    ))
    ]
    );
  }

}