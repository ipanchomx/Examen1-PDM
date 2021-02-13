import 'package:estructura_practica_uno/cart/cart.dart';
import 'package:estructura_practica_uno/drinks/hot_drinks_page.dart';
import 'package:estructura_practica_uno/grains/grains_page.dart';
import 'package:estructura_practica_uno/home/drawer_profile.dart';
import 'package:estructura_practica_uno/models/carrito.dart';
import 'package:estructura_practica_uno/models/credential.dart';

import 'package:estructura_practica_uno/postres/postres_page.dart';
import 'package:estructura_practica_uno/utils/constants.dart';

import 'package:flutter/material.dart';
import 'package:estructura_practica_uno/home/item_home.dart';

Carrito carrito;

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<Object> args = ModalRoute.of(context).settings.arguments;
    Credential credential = args[0];
    carrito = args[1];

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
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
        ],
      ),
      drawer: Drawer(
        child: DrawerProfile(
          user: credential.user,
          carrito: carrito,
        ),
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: ItemHome(
              title: "Bebidas calientes",
              image: "https://i.imgur.com/XJ0y9qs.png",
            ),
          ),
          GestureDetector(
            onTap: _openDessertPage,
            child: ItemHome(
              title: "Postres",
              image: "https://i.imgur.com/fI7Tezv.png",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Granos",
              image: "https://i.imgur.com/5MZocC1.png",
            ),
          ),
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text("Proximamente..."),
                  ),
                );
              setState(() {});
            },
            child: ItemHome(
              title: "Tazas",
              image: "https://i.imgur.com/fMjtSpy.png",
            ),
          ),
        ],
      ),
    );
  }

  void _openHotDrinksPage() {
    // Navigator.of(context).pushNamed("/HotDrinksPage", arguments: carrito);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HotDrinksPage(
          drinksList: hotDrinksItems,
        ),
        settings: RouteSettings(arguments: carrito),
      ),
    );
  }

  void _openGrainsPage() {
    // Navigator.of(context).pushNamed("/GrainsPage", arguments: carrito);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GrainsPage(
          graintsList: grainsItems,
        ),
        settings: RouteSettings(arguments: carrito),
      ),
    );
  }

  void _openDessertPage() {
    // Navigator.of(context).pushNamed("/PostresPage", arguments: carrito);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PostresPage(
          dessertsList: dessertsItems,
        ),
        settings: RouteSettings(arguments: carrito),
      ),
    );
  }
}
