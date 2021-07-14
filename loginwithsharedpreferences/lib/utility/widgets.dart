import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

InputDecoration buildInputDecoration (String hintText,IconData iconData)
{
  return InputDecoration(
    hintText: hintText,
    prefixIcon: Icon(iconData,color: Colors.blue,),
        contentPadding: EdgeInsets.all(25),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

  );
}

MaterialButton btn(String title,Function() fun,{Color color:Colors.blue,Color textColor:Colors.white})
{
  return MaterialButton(onPressed: fun,textColor: textColor,color: color,child: SizedBox(
    width: double.infinity,
    child: Text(title,textAlign: TextAlign.center,),

  ),
    height: 45,
    minWidth: 600,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
  );
}