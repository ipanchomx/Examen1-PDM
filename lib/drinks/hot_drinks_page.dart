import 'package:estructura_practica_uno/drinks/item_hot_drinks_details.dart';
import 'package:estructura_practica_uno/models/carrito.dart';

import 'package:flutter/material.dart';
import 'package:estructura_practica_uno/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_uno/models/product_hot_drinks.dart';

class HotDrinksPage extends StatelessWidget {
  final List<ProductHotDrinks> drinksList;
  HotDrinksPage({
    Key key,
    @required this.drinksList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Carrito carrito = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
      ),
      body: ListView.builder(
        itemCount: drinksList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ItemHotDrinksDetails(
                    drink: drinksList[index],
                  ),
                  settings: RouteSettings(arguments: carrito),
                ),
              );
            },
            child: ItemHotDrinks(
              drink: drinksList[index],
            ),
          );
        },
      ),
    );
  }
}
