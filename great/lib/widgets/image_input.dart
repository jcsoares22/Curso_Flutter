import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: Text('Nenhuma imagem! '),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            onPressed: () {},
            label: Text('Tirar Foto'),
            icon: Icon(Icons.camera),
          ),
        )
      ],
    );
  }
}
