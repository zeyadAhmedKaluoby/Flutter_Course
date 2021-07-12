import 'package:flutter/material.dart';

const apiKey = '1cf97f50679cc361cd9d73871e1f7eeb';
const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);
final kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(Icons.location_city),
    hintText: 'Enter City Name',
    hintStyle: TextStyle(color: Colors.grey),
    border:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide.none));

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
