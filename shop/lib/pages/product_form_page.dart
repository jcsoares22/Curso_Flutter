import 'package:flutter/material.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();

  void Dispose() {
    super.dispose();
    _priceFocus.dispose();
  }

//@override
  //uture<Void> dispose() async {
  //super.dispose();
  //_//priceFocus.dispose();
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de produtos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocus);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'preço'),
              textInputAction: TextInputAction.next,
              focusNode: _priceFocus,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descriptionFocus);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Descrição'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocus);
              },
            ),
          ],
        )),
      ),
    );
  }
}
