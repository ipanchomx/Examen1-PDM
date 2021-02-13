import 'package:estructura_practica_uno/models/product_item_cart.dart';
import 'package:flutter/material.dart';

class Carrito {
  List<ProductItemCart> carrito;

  Carrito({
    @required this.carrito,
  });

  void eliminarProducto(ProductItemCart prod) {
    int index = this.carrito.indexOf(prod);
    if (index > -1) {
      this.carrito.remove(prod);
    }
  }
}
