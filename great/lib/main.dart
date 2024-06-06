import 'package:flutter/material.dart';
import 'package:great/screens/place_form_screen..dart';
import 'package:great/screens/places_list_screen.dart';
import 'package:great/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great places',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PlacesListScreen(),
      routes: {
        AppRoutes.PLACE_FORM: (ctx) => PlaceFormScreen(),
      },
    );
  }
}
