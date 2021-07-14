import 'package:flutter/material.dart';
import 'package:loginwithsharedpreferences/providers/auth_providers.dart';
import 'package:loginwithsharedpreferences/providers/user_provider.dart';
import 'package:loginwithsharedpreferences/screens/dashboard.dart';
import 'package:loginwithsharedpreferences/screens/login.dart';
import 'package:loginwithsharedpreferences/screens/register.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AuthProviders()),
        ChangeNotifierProvider(create: (_)=>UserProvider()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Login(),
        routes: {
          Login.id:(context)=>Login(),
          Register.id:(context)=>Register(),
          DashBoard.id:(context)=>DashBoard()
        },
      ),
    );
  }
}
