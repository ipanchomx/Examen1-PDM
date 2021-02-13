import 'package:estructura_practica_uno/session/inicio.dart';

import 'package:flutter/material.dart';

import 'package:estructura_practica_uno/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        // Define the default brightness and colors.

        primaryColor: PRIMARY_COLOR,
        buttonColor: Color(0xFFBCB0A1),

        // Define the default font family.
        fontFamily: 'AkzidenzGrotesk',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0),
        ),
      ),
      home: Inicio(),
    );
  }
}
