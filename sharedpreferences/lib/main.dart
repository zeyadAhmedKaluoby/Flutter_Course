import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
SharedPreferences ? preferences;
int size= 16;

void sharedPref()
async {  preferences = await SharedPreferences.getInstance();
         setState(() {
           size=preferences!.getInt('size')!;
         });

}
@override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    sharedPref();

    return Scaffold(
appBar: AppBar(title: Text('shared preferences'),actions: [
  IconButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
  }, icon: Icon(Icons.settings))
],),
      body: Center(
       child: Text('hello to shared preferences',style: TextStyle(fontSize:size.toDouble(),)
      ), // This trailing comma makes auto-formatting nicer for build methods.
    )
    );
  }
}
