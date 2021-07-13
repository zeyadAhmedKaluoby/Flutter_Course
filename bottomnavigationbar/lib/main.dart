import 'package:bottomnavigationbar/Curved/curved.dart';
import 'package:bottomnavigationbar/Floating/floating.dart';
import 'package:bottomnavigationbar/Normal/normal.dart';
import 'package:bottomnavigationbar/SpinCircle/spinCircle.dart';

import 'package:flutter/material.dart';

import 'Convex/convex.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NormalNav()));
                },
                child: Text('Normal')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ConvexNav()));
                },
                child: Text('Convex')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CurvedNave()));
                },
                child: Text('Curved')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FloatingNav()));
                },
                child: Text('Floating')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SpinCircleNav()));
                },
                child: Text('SpinCircle')),
          ],
        ),
      ),
    ));
  }
}
