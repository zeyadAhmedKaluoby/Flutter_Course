import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            children: [
              Container(
                color: Colors.red,
                width: 100.0,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.yellowAccent,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.yellow,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              Container(
                color: Colors.blue,
                width: 100.0,
              ),

            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}
