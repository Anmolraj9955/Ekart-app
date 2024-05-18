import 'package:anmolapp/models/catalog.dart';
import 'package:flutter/material.dart';

class cartmodel {

  static final cartModel = cartmodel.internal();
  cartmodel.internal();
  factory cartmodel() => cartModel;

  // catalog field
  late CatalogModel _catalog;

  // collection of ids - store ids of each item
  final List<int> _itemIds = [];

  // get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // get item in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  // add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

//  remove items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
