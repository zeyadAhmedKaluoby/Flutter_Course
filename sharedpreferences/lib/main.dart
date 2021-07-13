import 'package:flutter/material.dart';
import 'package:sharedpreferences/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
appBar: AppBar(title: Text('shared preferences'),actions: [
  IconButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
  }, icon: Icon(Icons.settings))
],),
      body: Center(

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
