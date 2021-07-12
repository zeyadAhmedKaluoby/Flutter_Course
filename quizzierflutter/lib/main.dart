
import 'package:flutter/material.dart';
import 'package:quizzierflutter/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
 /* List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];
  List<bool> answers = [true,false,true];
*/
  void alertMakingEndOfQuiz() async
  {
    if(quizBrain.checkEndOfQuiz())
      {
       await Alert(title: 'Quiz is ended',context: context).show();
        quizBrain.resetQuestionNum();
        scoreKeeper=[];
      }
  }
QuizBrain quizBrain = QuizBrain();
  //int quesNum = 0;
  bool flag =false;
  void trueOrFalse()
  {
    bool correctOrNot = quizBrain.getAnswer();

    if(correctOrNot ==flag) {
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    }else{
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      )); }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {

                setState(() {
                  flag=true;
                  trueOrFalse();

                 /* if (quesNum < quizBrain.getLengthOfQuestions() - 1) {
                    quesNum++;


                  }*/
                  alertMakingEndOfQuiz();

                  quizBrain.nextQuestion();
                });

              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {

                  flag=false;
                  trueOrFalse();
                  alertMakingEndOfQuiz();

                quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
