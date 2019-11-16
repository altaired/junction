import 'package:flutter/cupertino.dart';
import 'package:tuple/tuple.dart';

class ProductList extends StatelessWidget {
  final List<Product> productList;
  List<Tuple2<int, Product>> productAggregate;

  ProductList(this.productList){
    this.productAggregate = ProductList._countFrequency(productList);
    this.productAggregate.sort((t1, t2) => t1.item1 - t2.item1);

  }

  static List<Tuple2<int, Product>> _countFrequency(List<Product> productList) {
    var freqs = {};
    productList.forEach((product){
      freqs.update(product, (exists) => exists +1, ifAbsent: () => 0);
    });

  }

  /// Creates a stacked [BarChart] with sample data and no transition.
  factory ProductList.withSampleData() {
    return new ProductList(
      _createSampleData(),
    );
  }

  static List<Product> _createSampleData() {
    Product milk = Product(1, "milk", 100);
    Product chickenBreast = Product(2, "chicken breast", 300);
    Product blueCheese = Product(3, "blue cheese", 800);
    Product pasta = Product(3, "penne pasta", 50);

    return
      [
        milk,
        milk,
        milk,
        milk,
        chickenBreast,
        blueCheese,
        pasta,
      ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
    Expanded(
    child: ListView.builder(
        itemBuilder: (BuildContext context, int index){
          final Tuple2<int, Product> countProduct = productAggregate?.elementAt(index) ?? "";
          return Padding(
            padding: EdgeInsets.all(16),
            child: ProductAggregateEntry(
              key: Key(countProduct.item2.name),
              product: countProduct.item2,
              nbrProducts: countProduct.item1,
            ),
          );
    },
    itemCount: productAggregate.length,
    ),
  }
}

class ProductAggregateEntry extends StatelessWidget {

  Product product;
  int nbrProducts;

  ProductAggregateEntry({Key key, @required this.product, @required this.nbrProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          product.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        Text(
          (product.carbonFootPrint * nbrProducts).toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ],
    );
  }
}


//todo: abstract over quantaties
class Product {
  int id;
  String name;
  int carbonFootPrint;

  Product(this.id, this.name, this.carbonFootPrint){}

  static int compareByName(Product first, Product second) {
    return first.name.compareTo(second.name);
  }

}