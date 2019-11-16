import 'package:flutter/material.dart';
import 'package:junction/screens/dashboard.dart';
import 'package:junction/services/data.dart';
import 'package:junction/shared/header.dart';

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
              children: this._products.map((pr) {
                return TableRow(
                  children: <Widget>[
                    Center(child: Text(pr.desc)),
                    Center(child: Text(pr.amount.toString() + " st")),
                    Center(child: Text(pr.emission.toString() + " CO2")),
                    Center(
                      child:
                          Text((pr.amount * pr.emission).toString() + " CO2"),
                    ),
                  ],
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
