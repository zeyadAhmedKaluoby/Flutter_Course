import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function() onPress;
  final String text;
  BottomButton({required this.onPress,required this.text});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress
      ,
      child: Container(
        color: Color(kBottomContainerColor),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(child: Text(text)),
      ),
    );
  }
}
