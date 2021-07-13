import 'package:bottomnavigationbar/Screens/add.dart';
import 'package:bottomnavigationbar/Screens/discovery.dart';
import 'package:bottomnavigationbar/Screens/home.dart';
import 'package:bottomnavigationbar/Screens/message.dart';
import 'package:bottomnavigationbar/Screens/profile.dart';
import 'package:bottomnavigationbar/constats.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';

class FloatingNav extends StatefulWidget {
  const FloatingNav({Key? key}) : super(key: key);

  @override
  _FloatingNavState createState() => _FloatingNavState();
}

class _FloatingNavState extends State<FloatingNav> {
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
      //body: widgetOptions[_currenIndex],
      bottomNavigationBar: FloatingNavBar(hapticFeedback: true, items: [
        FloatingNavBarItem(title: 'Home', iconData: Icons.home, page: HomeScreen()),
        FloatingNavBarItem(title: 'Discovery', iconData: Icons.map, page: DiscoverScreen()),
        FloatingNavBarItem(title: 'Add', iconData: Icons.add, page: AddScreen()),
        FloatingNavBarItem(title: 'Message', iconData: Icons.message, page: MessageScreen()),
        FloatingNavBarItem(title: 'Profile', iconData: Icons.people, page: ProfileScreen()),
      ], horizontalPadding: 20, color: Colors.red,


      ),
    );
  }
}
