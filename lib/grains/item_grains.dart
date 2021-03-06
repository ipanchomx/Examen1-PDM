import 'package:flutter/material.dart';
import 'package:estructura_practica_uno/models/product_grains.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grain;
  ItemGrains({
    Key key,
    @required this.grain,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
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
                          child: Text(
                            "Bolsa",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${widget.grain.productTitle}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            top: 35,
                          ),
                          child: Text(
                            "\$${widget.grain.productPrice}",
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 30,
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
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                child: Image.network(
                  "${widget.grain.productImage}",
                  fit: BoxFit.contain,
                  height: 160,
                  width: 160,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: Icon(Icons.favorite),
                color: widget.grain.liked ? Colors.indigo : Colors.grey[800],
                onPressed: () {
                  setState(() {
                    widget.grain.liked = !widget.grain.liked;
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
