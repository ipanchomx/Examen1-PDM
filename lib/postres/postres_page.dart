import 'package:estructura_practica_uno/models/carrito.dart';
import 'package:estructura_practica_uno/models/product_dessert.dart';
import 'package:estructura_practica_uno/postres/item_postres.dart';
import 'package:estructura_practica_uno/postres/item_postres_details.dart';
import 'package:flutter/material.dart';

class PostresPage extends StatelessWidget {
  final List<ProductDesserts> dessertsList;
  PostresPage({
    Key key,
    this.dessertsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Carrito carrito = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Postres"),
      ),
      body: ListView.builder(
        itemCount: dessertsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ItemDessertsDetailsPage(
                    dessert: dessertsList[index],
                  ),
                  settings: RouteSettings(arguments: carrito),
                ),
              );
            },
            child: ItemDesserts(
              dessert: dessertsList[index],
            ),
          );
        },
      ),
    );
  }
}
