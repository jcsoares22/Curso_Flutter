import 'package:flutter/material.dart';

import 'package:loja/components/Seleciona_Loja.dart';
import 'package:loja/model/modelo.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

Widget _ProdutosLojaConteiner(Widget child, BuildContext context) {
  final Modelo modelo = ModalRoute.of(context)!.settings.arguments as Modelo;
  return Container(
    width: 350,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    padding: EdgeInsets.all(10),
    child: child,
  );
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar Loja.'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: RadioLoja(),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Container(
              child: SearchBar(),
            ),
            Container(
              child: _ProdutosLojaConteiner(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Column(
                        children: [
                          Container(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
