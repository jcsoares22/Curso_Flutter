import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/providers/counter.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo Contador'),
      ),
      body: Column(
        children: [
          Text(CounterProvider.of(context)?.state.value.toString() ?? '0'),
          IconButton(
            onPressed: () {
              CounterProvider.of(context)?.state.inc();
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
              onPressed: () {
                CounterProvider.of(context)?.state.dec();
              },
              icon: Icon(Icons.remove)),
        ],
      ),
    );
  }
}
