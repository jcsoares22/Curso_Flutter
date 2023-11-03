import 'package:flutter/material.dart'
    show BuildContext, Column, StatelessWidget, Widget;
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });
  bool get TemPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> resposta = TemPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...resposta.map(
          (resp) => Resposta(resp['texto'] as String,
              () => quandoResponder(int.parse(resp['pontuacao'].toString()))),
        )
      ],
    );
  }
}
