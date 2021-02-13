import 'package:estructura_practica_uno/cart/cart.dart';
import 'package:estructura_practica_uno/models/carrito.dart';
import 'package:estructura_practica_uno/models/product_dessert.dart';
import 'package:estructura_practica_uno/models/product_item_cart.dart';
import 'package:estructura_practica_uno/models/product_repository.dart';

import 'package:flutter/material.dart';

class ItemDessertsDetailsPage extends StatefulWidget {
  final ProductDesserts dessert;

  ItemDessertsDetailsPage({Key key, @required this.dessert}) : super(key: key);

  @override
  _ItemDessertsDetailsPageState createState() =>
      _ItemDessertsDetailsPageState();
}

class _ItemDessertsDetailsPageState extends State<ItemDessertsDetailsPage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Carrito carrito = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Text(
                "${widget.dessert.productTitle}",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFFFABF7C)),
                  height: 350,
                  width: 350,
                  child: Stack(
                    children: [
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child:
                              Image.network("${widget.dessert.productImage}"),
                        ),
                      ),
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(Icons.favorite),
                        ),
                        alignment: Alignment.topRight,
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "${widget.dessert.productTitle}",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30,
                  top: 20,
                ),
                child: Text("${widget.dessert.productDescription}"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: Text("Tamaños disponibles"),
                        ),
                        Row(
                          children: [
                            ActionChip(
                              label: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'REBA',
                                  style: TextStyle(
                                      color: Colors.purple[900],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.dessert.productSize =
                                      ProductPresentation.REBANADA;
                                  widget.dessert.productPrice =
                                      widget.dessert.productPriceCalculator();
                                });
                              },
                              backgroundColor: (widget.dessert.productSize ==
                                      ProductPresentation.REBANADA)
                                  ? Colors.purple[200]
                                  : Colors.grey,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ActionChip(
                              label: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'COMP',
                                  style: TextStyle(
                                      color: Colors.purple[900],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.dessert.productSize =
                                      ProductPresentation.COMPLETO;
                                  widget.dessert.productPrice =
                                      widget.dessert.productPriceCalculator();
                                });
                              },
                              backgroundColor: (widget.dessert.productSize ==
                                      ProductPresentation.COMPLETO)
                                  ? Colors.purple[200]
                                  : Colors.grey,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Column(
                      children: [
                        Text("Precio"),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${widget.dessert.productPrice}",
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          height: 50,
                          color: Color(0xFFBCB0A1),
                          child: Text(
                            "AGREGAR AL CARRITO",
                            style: TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {
                            ProductItemCart producto = ProductItemCart(
                              productTitle: widget.dessert.productTitle,
                              productAmount: 1,
                              productPrice: widget.dessert.productPrice,
                              typeOfProduct: ProductType.POSTRES,
                              productImage: widget.dessert.productImage,
                            );
                            carrito.carrito.add(producto);

                            _scaffoldKey.currentState
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Producto agregado al carrito! :)'),
                                  action: SnackBarAction(
                                    label: "Listo",
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              );
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          height: 50,
                          color: Color(0xFFBCB0A1),
                          child: Text(
                            "COMPRAR AHORA",
                            style: TextStyle(
                                fontSize: 13.0,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Cart(
                                  productsList: carrito.carrito,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
