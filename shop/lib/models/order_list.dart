import 'dart:convert';
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
    final date = DateTime.now();

    final response = await http.post(
      Uri.parse('${Constants.ORDER_BASE_URL}.json'),
      body: jsonEncode(
        {
          'total': cart.totalAmount,
          'date': date.toIso8601String(),
          'product': cart.items.values
              .map(
                (CartItem) => {
                  'id': CartItem.id,
                  'productId': CartItem.productId,
                  'name': CartItem.name,
                  'quantity': CartItem.quantity,
                  'price': CartItem.price,
                },
              )
              .toList(),
        },
      ),
    );

    final id = jsonDecode(response.body)['name'];
    _items.insert(
      0,
      Order(
        id: id,
        total: cart.totalAmount,
        date: date,
        product: cart.items.values.toList(),
      ),
    );
    notifyListeners();
  }
}
