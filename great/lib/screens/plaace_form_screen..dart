import 'package:flutter/material.dart';

class PlaaceFormScreen extends StatefulWidget {
  const PlaaceFormScreen({super.key});

  @override
  State<PlaaceFormScreen> createState() => _PlaaceFormScreenState();
}

class _PlaaceFormScreenState extends State<PlaaceFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo lugar"),
      ),
      body: Center(
        child: Text('Form'),
      ),
    );
  }
}
