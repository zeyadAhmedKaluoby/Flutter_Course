import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final formKey =GlobalKey<FormState>();// eldata bta3t elform htt5zen f elkey d
    final scaffoldKey =GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(

      ),
      //to make validate for Form widget
      body: Form(key: formKey
        ,child: Column(
        children: [
        TextFormField(decoration: InputDecoration(
          hintText: 'Enter your name',
        ),
          validator: (value){
          if(value!.isEmpty)
            {
              return 'Name required';
            }
          else
            {
              return null;
            }
            },
        ),
      ElevatedButton(
        onPressed: () {
          print(formKey.currentState!.validate());
          if(formKey.currentState!.validate())
            {
scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(' validate')));

            }
        }, child: Text('make validate'),)
        ],
      ),

      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
