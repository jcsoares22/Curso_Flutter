import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 12) {
      return 'Você é impressionante!';
    } else {
      return 'nivel jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado + '\nTirou a nota ' + pontuacao.toString(),
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextButton(
            child: Text('Reiniciar ?'), onPressed: quandoReiniciarQuestionario)
      ],
    );
  }
}
