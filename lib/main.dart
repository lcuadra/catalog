import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calatolg/bloc/products_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductsBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Catalog(),
      ),
    );
  }
}

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ProductsBloc>(context);
    final products = bloc.products;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.of(context).push(ShoppingCartPage.go()),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (_, int i) {
          final product = products[i];

          return CheckboxListTile(
            title: Text(product.name),
            subtitle: Text("\$${product.price}"),
            value: product.isChecked,
            onChanged: (value) => bloc.updateProduct(value!, product),
          );
        },
      ),
    );
  }
}

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  static Route go() {
    return MaterialPageRoute<void>(builder: (_) => ShoppingCartPage());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ProductsBloc>(context);
    final cart = bloc.cart;

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemCount: cart.length,
            itemBuilder: (_, index) {
              final product = cart[index];

              return ListTile(
                title: Text(product.name),
                trailing: Text('\$${product.price}'),
              );
            },
            separatorBuilder: (_, __) => Divider(),
          ),
          Text('Total: \$${bloc.total}'),
        ],
      ),
    );
  }
}
