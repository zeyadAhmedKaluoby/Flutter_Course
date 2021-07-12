import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BallPage(),
    );
  }
}

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Center(
            child: Text('Ask me any thing'),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: Ball());
  }
}


class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child:FlatButton(onPressed: () {
        print('I got clicked');
        setState(() {
          ballNumber = Random().nextInt(4)+1;
        });
        print(ballNumber);
      },
      child:  Image.asset('images/ball$ballNumber.png'),)
    );
  }
}

