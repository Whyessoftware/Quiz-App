import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(this.answerChosenHandler, this.answerText, {super.key});

  final VoidCallback answerChosenHandler;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: const ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white),
            backgroundColor: MaterialStatePropertyAll(Colors.blue)),
        onPressed: answerChosenHandler,
        child: Text(answerText),
      ),
    );
  }
}
