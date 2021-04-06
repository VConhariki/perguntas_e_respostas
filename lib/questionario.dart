import 'package:flutter/material.dart';
import 'package:perguntas_e_respostas/questao.dart';
import 'package:perguntas_e_respostas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario(
      {@required this.perguntas,
      @required this.perguntaSelecionada,
      @required this.responder});

  bool get isQuestionAvailable {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        isQuestionAvailable ? perguntas[perguntaSelecionada]['answer'] : null;
    return Column(
      children: [
        Questao(perguntas.elementAt(perguntaSelecionada)['text']),
        ...answers
            .map((a) => Resposta(a['texto'], () => responder(a['nota'])))
            .toList(),
        /* 
          answers.map((a) => Resposta(a, _answer)).toList() is the same of:
          for (String ans in answers) {
            widgets.add(Resposta(ans, _answer));
          }
        */
      ],
    );
  }
}
