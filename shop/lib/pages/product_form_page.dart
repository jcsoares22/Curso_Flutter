import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shop/models/product.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();

  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void initState() {
    super.initState();
    _imageUrlController.addListener(updateImage);
  }

  void Dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageUrlController.removeListener(updateImage);
    _imageUrlFocus.dispose();
  }

  void updateImage() {
    setState(() {});
  }

  bool isValidadImageURL(String url) {
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    bool endsWithFile = url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.jpag') ||
        url.toLowerCase().endsWith('.jpg');
    return isValidUrl && endsWithFile;
  }

  Future _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();
    final newProduct = Product(
      id: Random().nextDouble().toString(),
      name: _formData['name'] as String,
      description: _formData['descripton'] as String,
      price: _formData['price'] as double,
      imageUrl: _formData['imageUrl'] as String,
    );

    print(newProduct.id);
    print(newProduct.name);
    print(newProduct.price);
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
        actions: [
          IconButton(
            onPressed: _submitForm,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocus);
                },
                onSaved: (name) => _formData['name'] = name ?? '',
                validator: (_name) {
                  final name = _name ?? '';

                  if (name.trim().isEmpty) {
                    return 'Nome é obrigatório!';
                  }

                  if (name.trim().length < 3) {
                    return 'Nome precisa no mínimo de 3 letras.!';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'preço'),
                textInputAction: TextInputAction.next,
                focusNode: _priceFocus,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocus);
                },
                onSaved: (price) =>
                    _formData['price'] = double.parse(price ?? '0'),
                validator: (_price) {
                  final priceString = _price ?? '-1';
                  final price = double.tryParse(priceString) ?? -1;

                  if (price <= 0) {
                    return 'Informe um preço válido.';
                  }

                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
                textInputAction: TextInputAction.next,
                focusNode: _descriptionFocus,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_imageUrlFocus);
                },
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                onSaved: (descripton) =>
                    _formData['descripton'] = descripton ?? '',
                validator: (_descripton) {
                  final descripton = _descripton ?? '';

                  if (descripton.trim().isEmpty) {
                    return 'descrição é obrigatória.';
                  }

                  if (descripton.trim().length < 10) {
                    return 'Descrição precisa no mínimo de 10 letras.!';
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Url da Imagem'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.url,
                      //textInputAction: TextInputAction.done,
                      //  textDirection: TextInputAction.done,
                      focusNode: _imageUrlFocus,
                      controller: _imageUrlController,
                      onFieldSubmitted: (_) => _submitForm,
                      onSaved: (imageUrl) =>
                          _formData['imageUrl'] = imageUrl ?? ' ',

                      validator: (_imageUrl) {
                        final imageUrl = _imageUrl ?? '';
                        if (!isValidadImageURL(imageUrl)) {
                          return 'Informe uma Url Valida!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: _imageUrlController.text.isEmpty
                        ? Text('informe a Url')
                        : FittedBox(
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
