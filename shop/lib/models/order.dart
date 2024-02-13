import 'package:shop/models/cart_item.dart';

class Order {
  final String id;
  final double total;
  final List<CartItem> product;
  final DateTime date;

  Order({
    required this.id,
    required this.total,
    required this.product,
    required this.date,
  });
}
