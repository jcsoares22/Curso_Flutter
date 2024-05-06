import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/models/cart.dart';
import 'package:shop/models/order.dart';
import 'package:shop/utils/constants.dart';

class OrderList with ChangeNotifier {
  final List<Order> _items = [];

  int get itemsCount {
    return _items.length;
  }

  List<Order> get items {
    return [..._items];
  }

  Future<void> addOrder(Cart cart) async {
    final future = http.post(
      Uri.parse('${Constants.ORDER_BASE_URL}.json'),
      body: jsonEncode(
        {},
      ),
    );

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
