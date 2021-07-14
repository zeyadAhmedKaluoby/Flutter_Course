import 'package:flutter/material.dart';
import 'package:loginwithsharedpreferences/domain/user.dart';
import 'package:loginwithsharedpreferences/providers/user_provider.dart';
import 'package:loginwithsharedpreferences/utility/shared_preferences.dart';

import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  static const id = '/dashboard';
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text("DASHBOARD PAGE"),
        elevation: 0.1,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(child: Text('${user.email}')),
          SizedBox(height: 100),
          RaisedButton(
            onPressed: () {
              UserPreferences().removeUser();
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Text("Logout"),
            color: Colors.lightBlueAccent,
          )
        ],
      ),
    );
  }
}