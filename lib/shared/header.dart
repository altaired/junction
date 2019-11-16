import 'package:flutter/material.dart';
import 'color_palatte.dart';

class Header extends StatelessWidget {
  final String title;

  Header({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      color: ColorPalatte.blueLilac,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              this.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
