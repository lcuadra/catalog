import 'package:flutter/material.dart';

import 'package:calatolg/model/product.dart';

class ProductsProvider extends InheritedWidget {
  ProductsProvider({
    required this.child,
    required this.bloc,
  }) : super(child: child);

  static ProductsProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProductsProvider>();
  }

  final Widget child;

  final ProductsBloc bloc;

  @override
  bool updateShouldNotify(ProductsProvider oldWidget) => oldWidget != this;
}

class ProductsBloc extends ChangeNotifier {
  List<Product> _products = [
    Product(
      name: "huevos",
      price: 2.0,
      isChecked: false,
    ),
    Product(
      name: "jamon",
      price: 15.0,
      isChecked: false,
    ),
    Product(
      name: "queso",
      price: 16.0,
      isChecked: false,
    ),
    Product(
      name: "pan",
      price: 25.0,
      isChecked: false,
    ),
    Product(
      name: "mayonesa",
      price: 20.0,
      isChecked: false,
    ),
    Product(
      name: "salsa de tomate",
      price: 20.0,
      isChecked: false,
    ),
  ];

  List<Product> get products => _products;

  void updateProduct(bool value, Product updatedProduct) {
    final index = _products.indexWhere(
      (product) => product.name == updatedProduct.name,
    );

    _products[index].isChecked = value;

    notifyListeners();
  }

  List<Product> get cart {
    return _products.where((item) => item.isChecked).toList();
  }

  double get total {
    var total = 0.0;
    for (final item in cart) total += item.price;
    return total;
  }
}
