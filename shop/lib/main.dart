import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/pages/counter_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/products_overview_pages.dart';
import 'package:shop/providers/counter.dart';
import 'package:shop/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, primary: Colors.black),
        secondaryHeaderColor: Colors.deepOrange,
        useMaterial3: true,
        fontFamily: 'Lato',
      ),
      home: ProductOverviewPage(),
      routes: {
        AppRoutes.PRODUCT_DETAIL: (context) => ProductDatailPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
