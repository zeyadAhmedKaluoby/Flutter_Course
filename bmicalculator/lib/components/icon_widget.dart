
import 'package:flutter/material.dart';

import 'package:bmicalculator/constants.dart';

class IconWidget extends StatelessWidget {
  final IconData iconContent;
  final String textContent;
  IconWidget({required this.iconContent,required this.textContent} );
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconContent,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          textContent,

          style:kTextContentStyle
          ,
        )
      ],
    );
  }
}