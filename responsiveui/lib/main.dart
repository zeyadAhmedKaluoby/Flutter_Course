import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            print(constraints);
            if (constraints.maxWidth > 500) {
              return Container(
                color: Colors.blue,
                child: RichText( text: TextSpan(text: 'rotate'),),
              );
            } else {
              return Container(
                color: Colors.yellow,
                child: RichText(text: TextSpan(text: 'not rotate')),
              );
            }
          },
        ),
      ),
    );
  }
}
