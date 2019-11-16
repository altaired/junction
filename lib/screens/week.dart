import 'package:flutter/material.dart';
import 'package:junction/screens/dashboard.dart';
import 'package:junction/services/data.dart';
import 'package:junction/shared/header.dart';
import 'package:junction/shared/table_row_text.dart';

class WeekPage extends StatelessWidget {
  final List<Product> _products = DataService.products;

  @override
  Widget build(BuildContext context) {
    final String week = ModalRoute.of(context).settings.arguments;
    _products.sort(
        (a, b) => ((b.emission * b.amount) - (a.emission * a.amount)).round());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Header(title: week),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Center(
              child: Text(
                "Purchased products",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Table(
              children:
                  ProductRowBuilder.build(this._products.take(8).toList()),
            ),
          )
        ],
      ),
    );
  }
}
