import 'package:estructura_practica_uno/cart/cart.dart';
import 'package:estructura_practica_uno/models/carrito.dart';
import 'package:flutter/material.dart';

class PagosPage extends StatefulWidget {
  final Carrito carrito;
  PagosPage({Key key, @required this.carrito}) : super(key: key);

  @override
  _PagosPageState createState() => _PagosPageState();
}

class _PagosPageState extends State<PagosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagos"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Cart(
                    productsList: widget.carrito.carrito,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(children: [
        Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 50.0,
                  top: 40.0,
                ),
                child: Text(
                  "Elige tu metodo de pago: ",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              PagosCard(
                tipoPago: "Tarjeta de crédito",
                logo:
                    "https://cdn.xl.thumbs.canstockphoto.es/-clipart-vectorial_csp28979256.jpg",
              ),
              PagosCard(
                tipoPago: "Paypal",
                logo:
                    "https://www.valoraanalitik.com/wp-content/uploads/2020/09/PayPal.jpg",
              ),
              PagosCard(
                tipoPago: "Tarjeta de regalo",
                logo:
                    "https://thumbs.dreamstime.com/z/muestra-y-s%C3%ADmbolo-del-vector-icono-de-la-tarjeta-regalo-aislados-en-el-fondo-blanco-concepto-logotipo-133760159.jpg",
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class PagosCard extends StatefulWidget {
  final String tipoPago;
  final String logo;
  const PagosCard({Key key, @required this.tipoPago, @required this.logo})
      : super(key: key);

  @override
  _PagosCardState createState() => _PagosCardState();
}

class _PagosCardState extends State<PagosCard> {
  bool buttonFlag = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Stack(
        children: [
          Positioned.fill(
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.all(24.0),
              child: Container(
                color: Color(0xFF8B8175),
              ),
            ),
          ),
          Container(
            height: 200,
            margin: EdgeInsets.only(top: 28, bottom: 24, left: 24, right: 24),
            child: Row(
              children: [
                Container(
                  width: 160,
                  height: 200,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                            ),
                            child: Image.network(
                              "${widget.logo}",
                              fit: BoxFit.contain,
                              height: 140,
                              width: 140,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 40,
              ),
              child: Text(
                "${widget.tipoPago}",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: Icon(Icons.check_circle),
                color: buttonFlag ? Colors.green : Colors.grey[800],
                onPressed: () {
                  setState(() {
                    buttonFlag = !buttonFlag;
                    showDialog(
                      context: context,
                      child: AlertDialog(
                        titlePadding: EdgeInsets.zero,
                        contentPadding: EdgeInsets.all(8),
                        title: Image.network(
                          "https://www.solucionesparaladiabetes.com/magazine-diabetes/wp-content/uploads/granos-cafe.jpg",
                          fit: BoxFit.fill,
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.local_cafe,
                                      size: 40,
                                      color: Colors.grey[850],
                                    ),
                                    title: Text(
                                      '¡Orden exitosa!',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Tu orden ha sido registrada, para más información busca en la opción de historial de compras en tu perfil.",
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                        actions: [
                          FlatButton(
                            textColor: Color(0xFF6200EE),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('ACEPTAR'),
                          ),
                        ],
                      ),
                    );
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
