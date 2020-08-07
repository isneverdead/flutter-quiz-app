import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite colour?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': 'Bread', 'score': 10},
        {'text': 'Chicken', 'score': 1},
        {'text': 'Tempe', 'score': 3},
        {'text': 'Burger', 'score': 5},
      ]
    },
    {
      'questionText': 'What\'s your favorite Animal?',
      'answers': [
        {'text': 'Hamster', 'score': 3},
        {'text': 'Bird', 'score': 10},
        {'text': 'Cat', 'score': 1},
        {'text': 'Dog', 'score': 5},
      ]
    },
    {
      'questionText': 'What\'s your favorite Singer?',
      'answers': [
        {'text': 'Selena Gomez', 'score': 1},
        {'text': 'The Weeknd', 'score': 1},
        {'text': 'Dua Lipa', 'score': 1},
        {'text': 'Shawn Mendes', 'score': 1},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    if (_questionIndex < _questions.length) {}
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer chosen!');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: (Text('akbar app')),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
