import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:great/model/place.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];


  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: null,
    );

    _items.add(newPlace);
    notifyListeners();
  }
}
