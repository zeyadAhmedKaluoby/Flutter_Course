import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceCounter = 1;
  int rightDiceCounter = 1;
  void randomizeDice(){
    leftDiceCounter = Random().nextInt(6) + 1;
    rightDiceCounter = Random().nextInt(6) + 1;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: FlatButton(
          onPressed: (){
    setState(() {
     /* leftDiceCounter = Random().nextInt(6) + 1;
      rightDiceCounter = Random().nextInt(6) + 1;*/
      randomizeDice();
    });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
               /* child: FlatButton(
                    onPressed: () {
                      setState(() {
                        leftDiceCounter = Random().nextInt(6) + 1;
                      });
                    },*/
                    child: Image(
                      image: AssetImage(
                          'images/dice$leftDiceCounter.png'), /*width: 150,*/
                    ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child:/* FlatButton(
                    onPressed: () {
                      setState(() {
                        rightDiceCounter = Random().nextInt(6) + 1;
                      });
                    },
                    child:*/ Image.asset(
                      'images/dice$rightDiceCounter.png', /*width: 150*/ /*before using expanded*/
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
