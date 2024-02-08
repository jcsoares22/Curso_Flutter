import 'package:flutter/material.dart';

/// Flutter code sample for [Radio].

class SelecionaLoja extends StatelessWidget {
  const SelecionaLoja({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('')),
        body: Center(
          child: RadioLoja(),
        ),
      ),
    );
  }
}

enum SingingCharacter { lafayette, jefferson }

class RadioLoja extends StatefulWidget {
  const RadioLoja({super.key});

  @override
  State<RadioLoja> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioLoja> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Califórnia Shoes'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Erika Shoes'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
