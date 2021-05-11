class Products {
  String producto;
  double precio;
  bool estado;

  Products({this.producto, this.precio, this.estado});
}

List<Products> products = [
  Products(
    producto: "huevos",
    precio: 2.0,
    estado: true,
  ),
  Products(
    producto: "jamon",
    precio: 15.0,
    estado: true,
  ),
  Products(
    producto: "queso",
    precio: 16.0,
    estado: true,
  ),
  Products(
    producto: "pan",
    precio: 25.0,
    estado: true,
  ),
  Products(
    producto: "mayonesa",
    precio: 20.0,
    estado: true,
  ),
  Products(
    producto: "salsa de tomate",
    precio: 20.0,
    estado: true,
  ),
];
