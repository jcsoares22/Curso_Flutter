import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/providers/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({
    super.key,
  });

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo Contador'),
      ),
      body: Column(
        children: [
          Text(CounterProvider.of(context)?.state.value.toString() ?? '0'),
          IconButton(
            onPressed: () {
              setState(() {
                 provider?.state.inc();
              });
             
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
              onPressed: () {
                 setState(() {
                 provider?.state.dec();
              },);              
              },
              icon: Icon(Icons.remove)),
        ],
      ),
    );
  }
}
