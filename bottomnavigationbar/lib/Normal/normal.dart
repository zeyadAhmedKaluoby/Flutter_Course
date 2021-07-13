import 'package:bottomnavigationbar/Screens/add.dart';
import 'package:bottomnavigationbar/Screens/discovery.dart';
import 'package:bottomnavigationbar/Screens/home.dart';
import 'package:bottomnavigationbar/Screens/message.dart';
import 'package:bottomnavigationbar/Screens/profile.dart';
import 'package:flutter/material.dart';

import '../constats.dart';

class NormalNav extends StatefulWidget {
  const NormalNav({Key? key}) : super(key: key);

  @override
  _NormalNavState createState() => _NormalNavState();
}

class _NormalNavState extends State<NormalNav> {

  int _currenIndex = 0;
  void _changeItem(int value)
  {
    setState(() {
      _currenIndex=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    print('normal');
    return Scaffold(
      body: widgetOptions.elementAt(_currenIndex),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon:Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon:Icon(Icons.map),label: 'Discovery'),
        BottomNavigationBarItem(icon:Icon(Icons.add),label: 'Add'),
        BottomNavigationBarItem(icon:Icon(Icons.message),label: 'Message'),
        BottomNavigationBarItem(icon:Icon(Icons.people),label: 'Profile'),

      ],
      currentIndex: _currenIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _changeItem,//by7dd m3aha elindex

      ),
    );
  }
}
