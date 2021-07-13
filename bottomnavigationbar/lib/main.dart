import 'package:bottomnavigationbar/Normal/normal.dart';
import 'package:bottomnavigationbar/Circle/circle.dart';
import 'package:bottomnavigationbar/Circle/circle.dart';


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
          child: Column(children: [
            ElevatedButton(onPressed:(){
              Navigator.push(context,MaterialPageRoute (builder:(context)=> NormalNav()));
            }, child: Text('Normal')),
            ElevatedButton(onPressed:(){}, child: Text('Circle')),
            ElevatedButton(onPressed:(){
              Navigator.push(context,MaterialPageRoute (builder:(context)=> ConvexNav()));

            }, child: Text('Convex')),
            ElevatedButton(onPressed:(){}, child: Text('Curved')),
            ElevatedButton(onPressed:(){}, child: Text('Floating')),
            ElevatedButton(onPressed:(){}, child: Text('SpinCircle')),

          ],),
        ),
      )
    );
  }
}
