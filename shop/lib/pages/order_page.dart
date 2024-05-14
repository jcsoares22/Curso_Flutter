import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/order.dart';
import 'package:shop/models/order_list.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<OrderList>(context, listen: false)
        .loadOrders()
        .then((_) => {_isLoading = false});
  }

  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus pedidos'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: orders.itemsCount,
          itemBuilder: (ctx, i) => OrderWidget(
              order: orders.items[i]) //OrderWidget(order: orders.items[i]),,
          ),
    );
  }
}
