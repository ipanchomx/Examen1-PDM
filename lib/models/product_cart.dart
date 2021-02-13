import 'package:estructura_practica_uno/models/product_dessert.dart';
import 'package:estructura_practica_uno/models/product_hot_drinks.dart';
import 'package:estructura_practica_uno/models/product_grains.dart';

class ProductCart {
  List<ProductHotDrinks> drinks;
  List<ProductGrains> grains;
  List<ProductDesserts> desserts;

  ProductCart({
    this.drinks,
    this.grains,
    this.desserts,
  });

  @override
  String toString() {
    String str = "HotDrinks: \n";
    for (int i = 0; i < drinks.length; i++) {
      str += drinks[i].productTitle +
          " : " +
          drinks[i].productAmount.toString() +
          "\n";
    }
    str += "Postres: \n";
    for (int i = 0; i < desserts.length; i++) {
      str += desserts[i].productTitle +
          " : " +
          desserts[i].productAmount.toString() +
          "\n";
    }
    str += "Granos: \n";
    for (int i = 0; i < grains.length; i++) {
      str += grains[i].productTitle +
          " : " +
          grains[i].productAmount.toString() +
          "\n";
    }

    return str;
  }
}
