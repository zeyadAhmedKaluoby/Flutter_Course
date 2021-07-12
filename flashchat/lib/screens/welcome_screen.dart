import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flashchat/components/reusable_buttons.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcomeScreen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? animation;
  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(seconds: 1),
        vsync: /*for a ticker*/ this /*because act as a ticker from mixin*/);
    /* animation = CurvedAnimation(
        parent: animationController as Animation<double>,
        curve: Curves.decelerate);*/
    animation = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(animationController as Animation<double>);
    animationController!.forward();
    /* animation!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController!.reverse();
      }
      else if (status == AnimationStatus.dismissed){
        animationController!.forward();
      }
    });*/
    animationController!.addListener(() {
      setState(() {});
      print(animation!.value);
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animationController!.value * 100,
                  ),
                ),
                AnimatedTextKit(animatedTexts: [TyperAnimatedText( 'Flash Chat',textStyle: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),speed: Duration(milliseconds: 200))],isRepeatingAnimation: false,),



              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ReusableButtons(text: 'Log In',color: Colors.lightBlueAccent,onPress:(){
              Navigator.pushNamed(context, LoginScreen.id);

            } ,),
             ReusableButtons(text: 'Register',color: Colors.blueAccent,onPress:(){
              Navigator.pushNamed(context, RegistrationScreen.id);

            } ,),
          ],
        ),
      ),
    );
  }
}


