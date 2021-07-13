import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../constats.dart';

class CurvedNave extends StatefulWidget {
  const CurvedNave({Key? key}) : super(key: key);

  @override
  _CurvedNaveState createState() => _CurvedNaveState();
}

class _CurvedNaveState extends State<CurvedNave> {
  int _currenIndex = 0;
  void _changeItem(int value)
  {
    setState(() {
      _currenIndex=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widgetOptions.elementAt(_currenIndex),
    bottomNavigationBar: CurvedNavigationBar(backgroundColor: Colors.red,items:[
      Icon(Icons.home),
      Icon(Icons.map),
      Icon(Icons.add),
      Icon(Icons.message),
      Icon(Icons.people)
    ],onTap:_changeItem ,index: _currenIndex,));
  }
}
