import 'package:flutter/material.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

class SpinCircleNav extends StatefulWidget {
  const SpinCircleNav({Key? key}) : super(key: key);

  @override
  _SpinCircleNavState createState() => _SpinCircleNavState();
}

class _SpinCircleNavState extends State<SpinCircleNav> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinCircleBottomBarHolder(bottomNavigationBar: SCBottomBarDetails(items: [
        SCBottomBarItem(icon: Icons.home, onPressed: (){}),
        SCBottomBarItem(icon: Icons.map, onPressed: (){}),
        SCBottomBarItem(icon: Icons.add, onPressed: (){}),
        SCBottomBarItem(icon: Icons.message, onPressed: (){}),
        SCBottomBarItem(icon: Icons.people, onPressed: (){}),
      ], circleItems: [
        SCItem(icon:Icon( Icons.home), onPressed: (){}),
        SCItem(icon:Icon( Icons.map), onPressed: (){}),
        SCItem(icon:Icon( Icons.add), onPressed: (){}),
        SCItem(icon:Icon( Icons.message), onPressed: (){}),
        SCItem(icon:Icon( Icons.people), onPressed: (){})
        ,      ])
        ,child:Container() ,),
    );
  }
}
