import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold( body:  Center(
      child: Image(
        width: 200,
        image: AssetImage('images/poor.png'),
      ),
    ),
      appBar: AppBar(title: Center(child: Text('I Am Poor')),
      backgroundColor: Colors.amber,
      ),
    )
  ));
}
