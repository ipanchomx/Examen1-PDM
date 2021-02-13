import 'package:estructura_practica_uno/home/home.dart';
import 'package:estructura_practica_uno/models/carrito.dart';
import 'package:estructura_practica_uno/models/credential.dart';

import 'package:estructura_practica_uno/models/product_item_cart.dart';
import 'package:estructura_practica_uno/session/sign_in.dart';
import 'package:estructura_practica_uno/utils/constants.dart';
// import 'package:estructura_practica_uno/models/product_cart.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  // final Map user = {};
  // SignUp({Key key, @required user}) : super(key: key);
  SignUp({
    Key key,
  }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  bool _checkBoxVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF214254),
                  Color(0XFF121B22),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.repeated,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 25),
                          child: Image(
                            image: AssetImage("assets/images/cupping.png"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Nombre completo: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'AkzidenzGrotesk',
                        fontSize: 13,
                      ),
                    ),
                  ),
                  subtitle: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _nameController,
                      style: TextStyle(fontStyle: FontStyle.normal),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Email: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'AkzidenzGrotesk',
                        fontSize: 13,
                      ),
                    ),
                  ),
                  subtitle: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _emailController,
                      style: TextStyle(fontStyle: FontStyle.normal),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Password: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'AkzidenzGrotesk',
                        fontSize: 13,
                      ),
                    ),
                  ),
                  subtitle: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 22,
                        width: 22,
                        decoration: BoxDecoration(
                          color: Color(0xFFBCB0A1),
                        ),
                        child: Checkbox(
                          value: _checkBoxVal,
                          onChanged: (bool newValue) {
                            setState(() {
                              _checkBoxVal = newValue;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "ACEPTO LOS TERMINOS Y CONDICIONES DE USO",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
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
                                  "Entrar",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  if (_nameController.text.isNotEmpty &&
                                      _passwordController.text.isNotEmpty &&
                                      _emailController.text.isNotEmpty &&
                                      _checkBoxVal) {
                                    Credential credential = Credential(
                                      pass: _passwordController.text,
                                      user: _nameController.text,
                                    );
                                    List<ProductItemCart> myCarrito =
                                        new List<ProductItemCart>();
                                    Carrito carrito =
                                        new Carrito(carrito: myCarrito);
                                    // Navigator.of(context).pushNamed("/Home",
                                    //     arguments: [credential, carrito]);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Home(
                                          title: APP_TITLE,
                                        ),
                                        settings: RouteSettings(
                                            arguments: [credential, carrito]),
                                      ),
                                    );

                                    if (_nameController.text.isEmpty) {
                                      _scaffoldKey.currentState
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                          SnackBar(
                                            content:
                                                Text('Nombre es requerido'),
                                          ),
                                        );
                                      setState(() {});
                                    } else {
                                      _scaffoldKey.currentState
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                          SnackBar(
                                            content:
                                                Text('Password es requerida'),
                                          ),
                                        );
                                      setState(() {});
                                    }
                                  }
                                })),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: InkWell(
                        child: Text(
                          "¿Olvidaste tu password?",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        onTap: () {},
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: InkWell(
                        child: Text(
                          "¿Aún no tienes una cuenta?",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        onTap: () {},
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Text(
                            "INGRESA",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            // Navigator.of(context).pushNamed("/SignIn");
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignIn(),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
