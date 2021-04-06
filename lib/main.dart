import 'package:flutter/material.dart';
import 'package:perguntas_e_respostas/finalizado.dart';
import 'package:perguntas_e_respostas/questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _total = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'text': 'Which color do you reather?',
      'answer': [
        {'texto': 'red', 'nota': 10},
        {'texto': 'green', 'nota': 5},
        {'texto': 'blue', 'nota': 3},
        {'texto': 'yellow', 'nota': 1},
      ],
    },
    {
      'text': 'Which animal do you reather?',
      'answer': [
        {'texto': 'dolphin', 'nota': 10},
        {'texto': 'cat', 'nota': 5},
        {'texto': 'dog', 'nota': 3},
        {'texto': 'monkey', 'nota': 1}
      ]
    },
    {
      'text': 'Which anime do you reather?',
      'answer': [
        {'texto': 'Steins;Gate', 'nota': 7},
        {'texto': 'Hunter x Hunter', 'nota': 9},
        {'texto': 'FMA', 'nota': 8},
        {'texto': 'Boku no Pico', 'nota': 30}
      ]
    }
  ];

  void _answer(int nota) {
    setState(() {
      _perguntaSelecionada++;
      _total += nota;
    });
    print(_total);
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _total = 0;
    });
  }

  bool get isQuestionAvailable {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Q&A'),
          ),
        ),
        body: isQuestionAvailable
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _answer,
              )
            : Finalizado(notaFinal: _total, onRestart: _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return new _PerguntaAppState();
  }
}
