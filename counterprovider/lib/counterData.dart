import 'package:flutter/cupertino.dart';

class CounterData extends ChangeNotifier{
  int counter = 0;
  void addCounter ()
  {
    counter++;
    notifyListeners();
  }

}