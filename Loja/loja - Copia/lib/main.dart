import 'package:flutter/material.dart';
import 'package:loja/components/Seleciona_Loja.dart';
import 'package:loja/screens/product.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Product(),
      debugShowCheckedModeBanner: false,
    );
  }
}
