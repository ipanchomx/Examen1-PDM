import 'package:estructura_practica_uno/cart/cart.dart';
import 'package:estructura_practica_uno/models/carrito.dart';
import 'package:estructura_practica_uno/models/product_hot_drinks.dart';
import 'package:estructura_practica_uno/models/product_item_cart.dart';
import 'package:estructura_practica_uno/models/product_repository.dart';

import 'package:flutter/material.dart';

class ItemHotDrinksDetails extends StatefulWidget {
  final ProductHotDrinks drink;

  ItemHotDrinksDetails({Key key, @required this.drink}) : super(key: key);

  @override
  _ItemHotDrinksDetailsState createState() => _ItemHotDrinksDetailsState();
}

class _ItemHotDrinksDetailsState extends State<ItemHotDrinksDetails> {
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
                "${widget.drink.productTitle}",
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
                  decoration: BoxDecoration(
                    color: Color(0xFFFABF7C),
                  ),
                  height: 350,
                  width: 350,
                  child: Stack(
                    children: [
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.network("${widget.drink.productImage}"),
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
                      "${widget.drink.productTitle}",
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
                child: Text("${widget.drink.productDescription}"),
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
                                  'CH',
                                  style: TextStyle(
                                      color: Colors.purple[900],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.drink.productSize = ProductSize.CH;
                                  widget.drink.productPrice =
                                      widget.drink.productPriceCalculator();
                                });
                              },
                              backgroundColor:
                                  (widget.drink.productSize == ProductSize.CH)
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
                                  'M',
                                  style: TextStyle(
                                      color: Colors.purple[900],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.drink.productSize = ProductSize.M;
                                  widget.drink.productPrice =
                                      widget.drink.productPriceCalculator();
                                });
                              },
                              backgroundColor:
                                  (widget.drink.productSize == ProductSize.M)
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
                                  'G',
                                  style: TextStyle(
                                      color: Colors.purple[900],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  widget.drink.productSize = ProductSize.G;
                                  widget.drink.productPrice =
                                      widget.drink.productPriceCalculator();
                                });
                              },
                              backgroundColor:
                                  (widget.drink.productSize == ProductSize.G)
                                      ? Colors.purple[200]
                                      : Colors.grey,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: Column(
                      children: [
                        Text("Precio"),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${widget.drink.productPrice}",
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
                            // products.add(widget.drink.productTitle);

                            ProductItemCart producto = ProductItemCart(
                              productTitle: widget.drink.productTitle,
                              productAmount: 1,
                              productPrice: widget.drink.productPrice,
                              typeOfProduct: ProductType.BEBIDAS,
                              productImage: widget.drink.productImage,
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
