import 'package:flutter/material.dart';
import 'package:quizzierflutter/question.dart';
//Encapsulation and abstraction
class QuizBrain{
  int _quesNum=0;
  List<Question> _questuibsObjs=[
    Question(question: 'You can lead a cow down stairs but not up stairs.', answer: false),
    Question(question: 'Approximately one quarter of human bones are in the feet.', answer: true),
    Question(question: 'A slug\'s blood is green.', answer: false)
  ];
  String getQuestion()
  {
    return _questuibsObjs[_quesNum].question;
  }
  void nextQuestion()
  {
    if (_quesNum < getLengthOfQuestions() - 1) {
      _quesNum++;


    }
  }
  bool getAnswer()
  {
    return _questuibsObjs[_quesNum].answer;
  }
  int getLengthOfQuestions()
  {
    return _questuibsObjs.length;
  }

  bool checkEndOfQuiz()
  {
    print(_quesNum);
    if(_quesNum==getLengthOfQuestions()-1)
      {

        return true;
      }
    else return false;
  }
  void resetQuestionNum()
  {
    _quesNum=0;
  }
}