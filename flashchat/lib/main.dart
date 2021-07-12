import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flashchat/screens/chat_screen.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

 runApp(FlashChat());
}
class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {

        'welcomeScreen': (context)=> WelcomeScreen()
        ,
        'loginScreen':(context)=> LoginScreen(),
        'registrationScreen':(context)=>RegistrationScreen(),
        'chatScreen':(context)=>ChatScreen()

      },
    );
  }
}
