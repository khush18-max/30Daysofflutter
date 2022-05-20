// ignore_for_file: unnecessary_getters_setters

import 'package:hello/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  //catalog field
  late Catalogmodel _catalog;
// Collection of Id's -store ID's of each item
  final List<int> _itemIds = [];
//get Catalog
  Catalogmodel get catalog => _catalog;

  set catalog(Catalogmodel newCatalog) {
    _catalog = newCatalog;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
