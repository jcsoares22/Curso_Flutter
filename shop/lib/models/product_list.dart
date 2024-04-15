import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final _baseUrl = 'https://shop-jc-default-rtdb.firebaseio.com/products';
  final List<Product> _items = [];

  List<Product> get items => [..._items];
  List<Product> get favoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  int get itemsCount {
    return _items.length;
  }

  Future<void> loadProducts() async {
    _items.clear();
    final response = await http.get(Uri.parse('$_baseUrl.json'),);
    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((Productid, ProductData) => _items.add(Product(
          id: Productid,
          name: ProductData['name'],
          description: ProductData['description'],
          price: ProductData['price'],
          imageUrl: ProductData['imageUrl'],
          isFavorite: ProductData['isFavorite'],
        )));
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  Future<void> SaveProduct(Map<String, Object> data) {
    bool hasId = data['id'] != null;

    final product = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['descripton'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );
    if (hasId) {
      return updateProduct(product);
    } else {
      return addProduct(product);
    }
  }

  Future<void> updateProduct(Product product) async{
    int index = _items.indexWhere((p) => p.id == product.id);


    if (index >= 0) {
      await http.patch(
      Uri.parse('$_baseUrl/${product.id}.json'),
      body: jsonEncode(
        {
          "name": product.name,
          "description": product.description,
          "price": product.price,
          "imageUrl": product.imageUrl,
          "isFavorite": product.isFavorite,
        },),);


      _items[index] = product;
      notifyListeners();
    }
    return Future.value();
  }

 Future<void>  removeProduct(Product product) async{
    int index = _items.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
    final product = _items[index];
       _items.remove(product);
      notifyListeners();


      final response =  await http.delete(
      Uri.parse('$_baseUrl/${product.id}'));
     

     if (response.statusCode >= 400){
      _items.insert(index, product);
       notifyListeners();
     }
    }
  }

  Future<void> addProduct(Product product) {
    final future = http.post(
      Uri.parse('$_baseUrl.json'),
      body: jsonEncode(
        {
          "name": product.name,
          "description": product.description,
          "price": product.price,
          "imageUrl": product.imageUrl,
          "isFavorite": product.isFavorite,
        },
      ),
    );

    return future.then((response) {
      final id = jsonDecode(response.body)['name'];
      _items.add(Product(
        id: id,
        name: product.name,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        isFavorite: product.isFavorite,
      ));
      notifyListeners();
    });
  }
}
