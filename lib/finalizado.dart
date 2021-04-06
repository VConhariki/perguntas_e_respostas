import 'package:flutter/material.dart';

class Finalizado extends StatelessWidget {
  final notaFinal;
  final void Function() onRestart;
  Finalizado({@required this.notaFinal, this.onRestart});

  String retText() {
    if (notaFinal > 30) {
      return "I can see you're a person of culture as well";
    } else {
      return 'Congratulations, you have answered all the questions!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            retText(),
            style: TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        MaterialButton(
          onPressed: onRestart,
          child: Text(
            'Restart?',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.red,
        )
      ],
    );
  }
}
