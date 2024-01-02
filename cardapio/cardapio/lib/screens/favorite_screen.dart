import 'package:flutter/material.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Minhas  Referição favorita'),
    );
  }
}
