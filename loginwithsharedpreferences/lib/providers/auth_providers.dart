import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:loginwithsharedpreferences/domain/user.dart';
import 'package:loginwithsharedpreferences/utility/appurl.dart';
import 'package:loginwithsharedpreferences/utility/shared_preferences.dart';

enum Status{
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProviders extends ChangeNotifier{
  Status _loogedInStatus=Status.NotLoggedIn;
  Status _registeredStatus=Status.NotRegistered;


  Status get loggedInStatus {return _loogedInStatus;}
  set loggedInStatus(Status val) {
    _loogedInStatus=val;
  }

  Status get registeredStatus {
    return _registeredStatus;
  }
  set registeredStatus(Status val){ _registeredStatus=val;}


  Future<Map<String,dynamic>> register(String email ,String password) async{
    final Map<String,dynamic> body={
      'email':email,
      'password':password
    };
    return await  http.post(
     Uri.parse(AppUrl.baseUrl) ,
      body: json.encode(body),
      headers: {'Content-Type':'application/json'}
    ).then(onValue).catchError(onError) as Map<String,dynamic>;
  }
  Future<Map<String, dynamic>> login(String email, String password) async {

    var result;

    final Map<String, dynamic> loginData = {
      'UserName': '',
      'Password': ''
    };

    _loogedInStatus = Status.Authenticating;
    notifyListeners();

    Response response = await post(
     Uri.parse(AppUrl.Login) ,
      body: json.encode(loginData),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '',
        'X-ApiKey' : ''
      },
    );

    if (response.statusCode == 200) {

      final Map<String, dynamic> responseData = json.decode(response.body);

      print(responseData);

      var userData = responseData['Content'];

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);

      _loogedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};

    } else {
      _loogedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }

    return result;

  }
  static Future<FutureOr> onValue(http.Response response) async{
    var result ;
    final Map<String,dynamic> responseData = json.decode( response.body);
    print(responseData);
    if(response.statusCode==200){
      var userData = responseData['data'];
      User authUser = User.fromJson(userData);
      UserPreferences().saveUser(authUser);
      result = {
        'status':true,
        'message':'Successfully added',
        'data':authUser
      };

    }else{
      result = {
        'status':false,
        'message':'Successfully registered',
        'data':responseData
      };
    }
    return result;
  }

  static onError(error)
  {
    print('the error is  ${error.detail }');
    return {
      'status':false,
      'message':'Unsuccessfully request',
      'data':error
    };
  }




}