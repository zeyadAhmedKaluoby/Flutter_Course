
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget ?cardChild;
  final VoidCallback ?onPress;
  ReusableCard({required this.color,this.cardChild,this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: EdgeInsets.all(15),
      ),
    );
  }
}
