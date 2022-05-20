import 'package:hello/models/catalog.dart';

class CartModel {
  //catalog field
  late Catalogmodel _catalog;
// Collection of Id's -store ID's of each item
  final List<int> _itemIds = [];
//get Catalog
  Catalogmodel get catalog => _catalog;

  set catalog(Catalogmodel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get items in the cart
  Iterable<Item> get items => _itemIds.map((id) => _catalog.getById(id));

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
