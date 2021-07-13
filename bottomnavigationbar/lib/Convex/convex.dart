import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../constats.dart';
//feih convex.badge({index}:'rkam notification msln') w elbadge leih properties
class ConvexNav extends StatefulWidget {
  const ConvexNav({Key? key}) : super(key: key);

  @override
  _ConvexNavState createState() => _ConvexNavState();
}

class _ConvexNavState extends State<ConvexNav> {
  int _currentIndex = 0;
  void _changeItem(int value)
  {
    setState(() {
      _currentIndex=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_currentIndex),

      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon:Icon(Icons.home),title: 'Home'),
          TabItem(icon:Icon(Icons.map),title: 'Discovery'),
          TabItem(icon:Icon(Icons.add),title: 'Add'),
          TabItem(icon:Icon(Icons.message),title: 'Message'),
          TabItem(icon:Icon(Icons.people),title: 'Profile'),
        ],
        initialActiveIndex: _currentIndex,
        onTap: _changeItem,
        backgroundColor: Colors.red,
      ),
    );
  }
}
