import 'package:hello/models/cart.dart';
import 'package:hello/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
 late Catalogmodel catalog;
   late CartModel cart;
  MyStore() {
    catalog = Catalogmodel();
    cart = CartModel();
    cart.catalog = catalog;

  }
}
