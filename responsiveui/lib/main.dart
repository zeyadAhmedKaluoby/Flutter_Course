import 'package:flutter/material.dart';
import 'package:responsiveui/responsive_reuse.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Appp()
    );
  }
}
class Appp extends StatelessWidget {
  const Appp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // Size size = MediaQuery.of(context).size;
    return  SafeArea(

        child:// size.width>=500? Scaffold(appBar:AppBar()):Scaffold()
         ResposiveReuse(web: Container(
                color: Colors.blue,
                child: RichText( text: TextSpan(text: 'rotate'),),
              ),mobile:Container(
                color: Colors.yellow,
                child: RichText(text: TextSpan(text: 'not rotate')),
              )


        ),
    );
  }
}
