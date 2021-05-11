import 'package:flutter/material.dart';

import 'package:calatolg/products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Catalog(),
    );
  }
}

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: products.length,
                itemBuilder: (_, int i) {
                  return ListTile(
                    title: Text(products[i].producto),
                    subtitle: Text("\$${products[i].precio}"),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
