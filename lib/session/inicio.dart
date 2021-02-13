import 'package:estructura_practica_uno/session/sign_in.dart';
import 'package:estructura_practica_uno/session/sign_up.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF214254),
              Color(0xFF15232d),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // stops: [0.0, 1.0],
            // tileMode: TileMode.repeated,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
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
                      padding: EdgeInsets.symmetric(vertical: 20),
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
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: MaterialButton(
                      height: 60,
                      color: Color(0xFFBCB0A1),
                      child: Text(
                        "REGISTRATE",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onPressed: () {
                        // Navigator.of(context).pushNamed(
                        //   "/SignUp",
                        // );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: MaterialButton(
                      color: Color(0xFFBCB0A1),
                      height: 60,
                      child: Text(
                        "INGRESA",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onPressed: () {
                        // Navigator.of(context).pushNamed("/SignIn");
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignIn(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
