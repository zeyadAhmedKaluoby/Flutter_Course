import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginwithsharedpreferences/domain/user.dart';
import 'package:loginwithsharedpreferences/providers/auth_providers.dart';
import 'package:loginwithsharedpreferences/providers/user_provider.dart';
import 'package:loginwithsharedpreferences/screens/dashboard.dart';
import 'package:loginwithsharedpreferences/screens/register.dart';
import 'package:loginwithsharedpreferences/utility/validator.dart';
import 'package:loginwithsharedpreferences/utility/widgets.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const id = '/login';

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? _email, _pass;
  final formKey = GlobalKey<FormState>();
  final loading = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [CircularProgressIndicator(),Text('please wait ...')],
  );
  @override
  Widget build(BuildContext context) {
    AuthProviders authe = Provider.of<AuthProviders>(context);

    final forgetLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/reset-password');
            },
            child: Text('Forget password')),
        FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Register.id);
            },
            child: Text('Register'))
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  autofocus: false,
                  validator: validateEmail,
                  onChanged: (val) => _email = val,
                  decoration:
                      buildInputDecoration('Enter your email', Icons.email),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  autofocus: false,
                  obscureText: true,
                  validator: (val) =>
                      val!.isEmpty ? 'Password is required' : null,
                  onChanged: (val) => _pass = val,
                  decoration: buildInputDecoration(
                      'Enter your password', Icons.password),
                ),
                SizedBox(
                  height: 20,
                ),
                authe.loggedInStatus==Status.Authenticating?loading:
                btn('Login', () {
                  final form = formKey.currentState;
                  if(form!.validate())
                    {
                      form.save();
                      final Future<Map<String,dynamic>> response = authe.login(_email!, _pass!);
                      response.then((value) {
                        if(value['status'])
                          {
                            User user = value['user'];
                            Provider.of<UserProvider>(context,listen: false).setUser(user);
                            Navigator.pushReplacementNamed(context, DashBoard.id);
                          }
                      });
                    }
                  else{
                    Flushbar(
                      title: 'invalid form',
                      message: 'please complete the form',
                      duration: Duration(seconds: 5),
                    ).show(context);
                  }
                }),
                forgetLabel
              ],
            ),
          ),
        ),
      ),
    );
  }
}
