import 'package:flutter/material.dart';
import 'package:shop/models/order.dart';
import 'package:intl/intl.dart';

class OrderWidget extends StatefulWidget {
  final Order order;
  const OrderWidget({
    super.key,
    required this.order,
  });

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
            subtitle:
                Text(DateFormat('dd/MM/yy hh:mm').format(widget.order.date)),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                icon: Icon(Icons.expand_more)),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: (widget.order.product.length * 25) + 10,
              child: ListView(
                children: widget.order.product.map(
                  (Product) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Product.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${Product.quantity}x  R\$ ${Product.price}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    );
                  },
                ).toList(),
              ),
            )
        ],
      ),
    );
  }
}
