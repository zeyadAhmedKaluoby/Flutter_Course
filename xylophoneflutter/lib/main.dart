import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playWavFile(int num)
  {
    final player = AudioCache();
    player.play('note$num.wav');
  }
  Widget expandedButtonsWidget(Color c,int num) =>Expanded(
      child: FlatButton(onPressed: () {
        playWavFile(num);
      }, color: c, child: Text(''),),
    );


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              expandedButtonsWidget(Colors.blue,1)
             ,
              expandedButtonsWidget(Colors.yellow,2)
              ,
              expandedButtonsWidget(Colors.pink,3)
              ,
              expandedButtonsWidget(Colors.teal,4)
              ,
              expandedButtonsWidget(Colors.red,5)
              ,
              expandedButtonsWidget(Colors.orange,6)
              ,
              expandedButtonsWidget(Colors.green,7)
              ,
            ],
          ),
        ),
      ),
    );
  }
}
