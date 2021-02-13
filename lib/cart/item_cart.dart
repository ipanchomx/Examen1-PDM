import 'package:estructura_practica_uno/models/carrito.dart';
import 'package:estructura_practica_uno/models/product_item_cart.dart';
import 'package:estructura_practica_uno/models/product_repository.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final ProductItemCart product;
  final ValueChanged<double> onAmountUpdated;
  final Carrito carrito;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
    this.carrito,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  bool deleteFlag = false;
  bool buttonFlag = false;

  @override
  Widget build(BuildContext context) {
    String prod = "";
    switch (widget.product.typeOfProduct) {
      case ProductType.BEBIDAS:
        prod = "Café";
        break;
      case ProductType.GRANO:
        prod = "Bolsa";
        break;
      case ProductType.POSTRES:
        prod = "Pastel";
        break;
      default:
    }
    return Container(
      height: 220,
      child: Stack(
        children: [
          Positioned.fill(
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.all(24.0),
              child: Container(
                color: Color(0xFFFABF7C),
              ),
            ),
          ),
          Container(
            height: 200,
            margin: EdgeInsets.only(top: 28, bottom: 24, left: 24, right: 24),
            child: Row(
              children: [
                Container(
                  width: 160,
                  height: 200,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                            ),
                            child: Image.network(
                              "${widget.product.productImage}",
                              fit: BoxFit.contain,
                              height: 150,
                              width: 150,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 50,
              ),
              child: Text(
                "$prod",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 80,
                left: 60,
              ),
              child: Text(
                "${widget.product.productTitle}",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                right: 60,
              ),
              child: Text(
                "${widget.product.productPrice}",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.only(
                  left: 185,
                  bottom: 30,
                ),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.add_circle_outline,
                        ),
                        color: Colors.indigo[900],
                        onPressed: _addProd),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "${widget.product.productAmount}",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.remove_circle_outline,
                        ),
                        color: Colors.indigo[900],
                        onPressed: _remProd),
                  ],
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: Icon(Icons.delete),
                color: deleteFlag ? Colors.red[900] : Colors.indigo[700],
                onPressed: () {
                  setState(() {
                    deleteFlag = !deleteFlag;
                    _deleteProd();
                  });
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: Icon(Icons.favorite),
                color: buttonFlag ? Colors.red[900] : Colors.indigo[700],
                onPressed: () {
                  setState(() {
                    buttonFlag = !buttonFlag;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    setState(() {
      --widget.product.productAmount;
      if (widget.product.productAmount < 1) _deleteProd();
    });
    widget.onAmountUpdated(-1 * widget.product.productPrice);
  }

  void _deleteProd() {
    setState(() {
      widget.carrito.eliminarProducto(widget.product);
    });

    widget.onAmountUpdated(
        -1 * widget.product.productPrice * widget.product.productAmount);
  }
}
