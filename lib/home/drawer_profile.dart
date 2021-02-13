import 'package:estructura_practica_uno/cart/cart.dart';
import 'package:estructura_practica_uno/models/carrito.dart';

import 'package:estructura_practica_uno/utils/constants.dart';
import 'package:flutter/material.dart';

class DrawerProfile extends StatelessWidget {
  final String user;
  final Carrito carrito;
  const DrawerProfile({Key key, @required this.user, @required this.carrito})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 150,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    PROFILE_PICTURE,
                  ),
                  minRadius: 40,
                  maxRadius: 80,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                user,
                // PROFILE_NAME,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 8,
              ),
              Text("$user@doe.com"),
              // Text(PROFILE_EMAIL),
              SizedBox(
                height: 16,
              ),
              ListTile(
                title: Text(PROFILE_CART),
                leading: Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xFF214254),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(
                        productsList: carrito.carrito,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(PROFILE_WISHES),
                leading: Icon(
                  Icons.thumb_up_alt_outlined,
                  color: Color(0xFF214254),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(PROFILE_HISTORY),
                leading: Icon(
                  Icons.store_mall_directory_outlined,
                  color: Color(0xFF214254),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(PROFILE_SETTINGS),
                leading: Icon(
                  Icons.settings,
                  color: Color(0xFF214254),
                ),
                onTap: () {},
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text(PROFILE_LOGOUT),
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed("/");
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
