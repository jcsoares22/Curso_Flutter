import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Resposta extends StatelessWidget {
  String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        child: Text(texto),
        onPressed: quandoSelecionado,
      ),
    );
  }
}
