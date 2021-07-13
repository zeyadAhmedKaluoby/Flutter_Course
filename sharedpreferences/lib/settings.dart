import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int? color = Colors.white.value;
  int ?size = 16;
  SharedPreferences ?preferences;
  void saveData (int c) async
  {

    preferences = await SharedPreferences.getInstance() ;
    preferences!. setInt('color', c);
  }
  void saveSize (int s)
  async {
    preferences = await SharedPreferences.getInstance() ;
    preferences!. setInt('size', s);
  }
  void getData()async
  {
    preferences = await SharedPreferences.getInstance() ;
    setState(() {
      color =  preferences!. getInt('color')?? Colors.white.value;
      size =  preferences!. getInt('size')?? size;

    });

  }
  @override
  void initState() {
    getData();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(color!),
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          RadioListTile(
              value: Colors.green.value,
              title: Text('green'),
              groupValue: color,
              onChanged: (int? val) {
                setState(() {
                  color = val;
                });
                saveData(color!);
              }),
          RadioListTile(
              value: Colors.orange.value,
              title: Text('orange'),
              groupValue: color,
              onChanged: (int? val) {
                setState(() {
                  color = val;
                });
                saveData(color!);

              }),
          RadioListTile(
              value: Colors.red.value,
              title: Text('red'),
              groupValue: color,
              onChanged: (int? val) {
                setState(() {
                  color = val;
                });
                saveData(color!);

              }),
          DropdownButton(value: size,onChanged: (int ?val){
            setState(() {
              size=val;
            });
            saveSize(size!);
          },items: [
            DropdownMenuItem(child: Text('16'),value: 16,onTap: (){},),

            DropdownMenuItem(child: Text('20'),value: 20,onTap: (){

            },),
            DropdownMenuItem(child: Text('40'),value: 50,onTap: (){},),
            DropdownMenuItem(child: Text('60'),value: 60,onTap: (){},),



          ])
        ],

      ),
    );
  }
}
