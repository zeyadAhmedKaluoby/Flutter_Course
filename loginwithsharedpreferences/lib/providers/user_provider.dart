import 'package:flutter/material.dart';
import 'package:loginwithsharedpreferences/domain/user.dart';

class UserProvider extends ChangeNotifier{

  User _user = User();


  User get user=>_user;
  void setUser(User user)
  {
    _user = user;
    notifyListeners();
  }



}