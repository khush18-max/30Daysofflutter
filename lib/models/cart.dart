// ignore_for_file: unnecessary_getters_setters

import 'package:hello/core/store.dart';
import 'package:hello/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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
}
class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
