import 'package:flutter/material.dart';
import 'package:great/widgets/image_input.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({super.key});

  @override
  State<PlaceFormScreen> createState() => _PlaaceFormScreenState();
}

class _PlaaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  void _submitform() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo lugar"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Título',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _submitform,
            label: Text(''),
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
