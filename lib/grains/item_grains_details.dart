import 'package:estructura_practica_uno/cart/cart.dart';
import 'package:estructura_practica_uno/models/carrito.dart';
import 'package:estructura_practica_uno/models/product_grains.dart';
import 'package:estructura_practica_uno/models/product_item_cart.dart';
import 'package:estructura_practica_uno/models/product_repository.dart';

import 'package:flutter/material.dart';

class ItemGrainsDetailsPage extends StatefulWidget {
  final ProductGrains grain;

  ItemGrainsDetailsPage({Key key, @required this.grain}) : super(key: key);

  @override
  _ItemGrainsDetailsPageState createState() => _ItemGrainsDetailsPageState();
}

class _ItemGrainsDetailsPageState extends State<ItemGrainsDetailsPage> {
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
                "${widget.grain.productTitle}",
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
                          child: Image.network("${widget.grain.productImage}"),
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
                      "${widget.grain.productTitle}",
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
                child: Text("${widget.grain.productDescription}"),
              ),
              SizedBox(
                height: 30,
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
                                  '250 G',
                                  style: TextStyle(
                                      color: Colors.purple[900],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.grain.productWeight =
                                      ProductWeight.CUARTO;
                                  widget.grain.productPrice =
                                      widget.grain.productPriceCalculator();
                                });
                              },
                              backgroundColor: (widget.grain.productWeight ==
                                      ProductWeight.CUARTO)
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
                                  'KILO',
                                  style: TextStyle(
                                      color: Colors.purple[900],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.grain.productWeight =
                                      ProductWeight.KILO;
                                  widget.grain.productPrice =
                                      widget.grain.productPriceCalculator();
                                });
                              },
                              backgroundColor: (widget.grain.productWeight ==
                                      ProductWeight.KILO)
                                  ? Colors.purple[200]
                                  : Colors.grey,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Column(
                      children: [
                        Text("Precio"),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${widget.grain.productPrice}",
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
                height: 20,
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
                              productTitle: widget.grain.productTitle,
                              productAmount: 1,
                              productPrice: widget.grain.productPrice,
                              typeOfProduct: ProductType.GRANO,
                              productImage: widget.grain.productImage,
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
