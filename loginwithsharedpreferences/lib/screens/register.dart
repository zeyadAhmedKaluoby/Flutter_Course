import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:loginwithsharedpreferences/domain/user.dart';
import 'package:loginwithsharedpreferences/providers/auth_providers.dart';
import 'package:loginwithsharedpreferences/providers/user_provider.dart';
import 'package:loginwithsharedpreferences/utility/validator.dart';
import 'package:loginwithsharedpreferences/utility/widgets.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const id = '/register';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  String _email='', _pass='', _confPass='';
  final loading = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [CircularProgressIndicator(),Text('please wait ...')],
  );
  @override
  Widget build(BuildContext context) {
    AuthProviders authe = Provider.of<AuthProviders>(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
                  onChanged: (val) {_email = val;
                  },
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
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  autofocus: false,
                  obscureText: true,
                  validator: (val) =>
                      val!.isEmpty ? 'Confirming password is required' : null,
                  onChanged: (val) => _confPass = val,
                  decoration:
                      buildInputDecoration('Confirm password', Icons.password),
                ),
                SizedBox(
                  height: 20,
                ),
                authe.loggedInStatus==Status.Authenticating?loading:
                btn('Register', () {
                  final form = formKey.currentState;
                  print(form!.validate());
                  if (form!.validate()) {
                    form.save();
                    print(_email);
                    if (!_pass.contains(_confPass)){
                      Flushbar(
                        title: 'mismatch password',
                        message: 'please enter valid confirm password',
                        duration: Duration(seconds: 5),
                      ).show(context);
                    }else{
                      authe.register(_email, _pass).then((response){
                        if(response['status']==true)
                          {
                            User user = response['data'];
                            Provider.of<UserProvider>(context).setUser(user);
                            Navigator.pushReplacementNamed(context, Login.id);
                          }
                        else
                          {
                            Flushbar(
                              title: 'registeration failed',
                              message: response.toString(),
                              duration: Duration(seconds: 5),
                            ).show(context);
                          }
                      });
                    }
                  }
                    else {
                    Flushbar(
                      title: 'invalid form',
                      message: 'please complete the form',
                      duration: Duration(seconds: 5),
                    ).show(context);
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
