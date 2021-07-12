import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: InputPage(),
      //theme: ThemeData.dark(),
      theme: ThemeData.dark().copyWith(primaryColor: /*Colors.black*/
          Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21) ,
          textTheme: TextTheme(body1: TextStyle(color: Colors.white)),//for background
          ),
    );
  }
}
