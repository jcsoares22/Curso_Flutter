import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order.dart';

class OrderList with ChangeNotifier {
  final List<Order> _items = [];

  int get itemsCount {
    return _items.length;
  }

  List<Order> get items {
    return [..._items];
  }

  void addOrder(Cart cart) {
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        date: DateTime.now(),
        product: cart.items.values.toList(),
      ),
    );

    notifyListeners();
  }
}
