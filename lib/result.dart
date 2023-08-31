import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {required this.resultScore, required this.resultHandler, super.key});

  final int resultScore;
  final VoidCallback resultHandler;

  String get resultPhase {
    var resultText;
    if (resultScore <= 15) {
      resultText = 'You\'re awesome';
    } else if (resultScore <= 10) {
      resultText = 'That\'s fair enough';
    } else {
      resultText = 'You perform woefully';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhase,
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            onPressed: resultHandler,
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
