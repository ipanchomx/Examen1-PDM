import 'package:estructura_practica_uno/grains/item_grains.dart';
import 'package:estructura_practica_uno/grains/item_grains_details.dart';
import 'package:estructura_practica_uno/models/carrito.dart';

import 'package:estructura_practica_uno/models/product_grains.dart';

import 'package:flutter/material.dart';

class GrainsPage extends StatelessWidget {
  final List<ProductGrains> graintsList;
  GrainsPage({
    Key key,
    this.graintsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Carrito carrito = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Granos"),
      ),
      body: ListView.builder(
        itemCount: graintsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ItemGrainsDetailsPage(
                  grain: graintsList[index],
                ),
                // settings: RouteSettings(arguments: "Hola"),
                settings: RouteSettings(arguments: carrito),
              ));
            },
            child: ItemGrains(
              grain: graintsList[index],
            ),
          );
        },
      ),
    );
  }
}
