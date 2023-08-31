import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'QuestionText': 'What\'s Your Favorite Meal?',
      'Answers': [
        {'text': 'Beans', 'score': 2},
        {'text': 'Rice', 'score': 4},
        {'text': 'Pepper Soup', 'score': 3},
      ]
    },
    {
      'QuestionText': 'What\'s Your Best Drinks?',
      'Answers': [
        {'text': 'Pepsi', 'score': 3},
        {'text': 'Coca Cola', 'score': 2},
        {'text': 'Malt', 'score': 1},
      ]
    },
    {
      'QuestionText': 'What\'s Your Favorite Recipes?',
      'Answers': [
        {'text': 'Tomato', 'score': 2},
        {'text': 'Spagetti', 'score': 3},
        {'text': 'Bugger', 'score': 4},
      ]
    },
    {
      'QuestionText': 'Do Drink Alcohol?',
      'Answers': [
        {'text': 'Yes', 'score': 2},
        {'text': 'No', 'score': 4},
      ]
    },
    {
      'QuestionText': 'What\'s Your Favorite Place?',
      'Answers': [
        {'text': 'Lagos', 'score': 5},
        {'text': 'Osun', 'score': 2},
        {'text': 'Ibadan', 'score': 3},
        {'text': 'Ogbomosho', 'score': 4},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    super.setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    super.setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('Move to the next Questions');
    } else {
      print('No More Question');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(resultScore: _totalScore, resultHandler: _resetQuiz),
      ),
    );
  }
}
