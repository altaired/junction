import 'package:flutter/material.dart';
import 'package:junction/services/data.dart';
import 'package:junction/shared/ColorPalatte.dart';
import 'package:junction/shared/bar_chart.dart';

class DashboardPage extends StatelessWidget {
  List<Product> _products = DataService.products;

  @override
  Widget build(BuildContext context) {
    _products.sort(
        (a, b) => ((b.emission * b.amount) - (a.emission * a.amount)).round());
    _products = _products.sublist(0, 3);
    return ListView(
      children: <Widget>[
        Center(
          child: Container(
            color: ColorPalatte.blueLilac,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: ColorPalatte.chromeGreen,
                        child: Center(
                          child: Text(
                            "SP",
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Simon Persson",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              "Joined",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "1020102",
                      style: TextStyle(fontSize: 32.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                child: BarChart.withSampleData(),
              ),
            ),
          ),
        ),
        Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                      child: Text(
                        "per product",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Table(
                      children: this._products.map((pr) {
                        return TableRow(
                          children: <Widget>[
                            Center(child: Text(pr.desc)),
                            Center(child: Text(pr.amount.toString() + " st")),
                            Center(
                                child: Text(pr.emission.toString() + " CO2")),
                            Center(
                              child: Text((pr.amount * pr.emission).toString() +
                                  " CO2"),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Product {
  final String desc;
  final double amount;
  final double emission;

  Product(
      {@required this.desc, @required this.amount, @required this.emission});
}
