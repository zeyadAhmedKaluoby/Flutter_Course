import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class RoundMaterialButton extends StatelessWidget {
  final IconData ?child;
  final Function() ?onPress;
  RoundMaterialButton({this.child,this.onPress});
  @override
  Widget build(BuildContext context) {

    return RawMaterialButton(
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Color(kFloatingWeightColor),
      elevation: 6,
      child: Icon(child ),
      constraints: BoxConstraints.tightFor(//to define its size
        width: 56,
        height: 56,

      ),
    );
  }
}
