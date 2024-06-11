import 'package:flutter/material.dart';
import 'package:great/model/place.dart';

class GratePlaces with ChangeNotifier {
  List<Place> __items = [];

  List<Place> get items {
    return [...__items];
  }

  int get itensCount {
    return __items.length;
  }

  Place ItemByIndex(int index) {
    return __items[index];
  }
}
