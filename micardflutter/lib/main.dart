import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.yellowAccent,
                  backgroundImage: NetworkImage(
                      'https://www.jordanharbinger.com/wp-content/uploads/2018/09/be-the-most-interesting.jpg'),
                ),
                Text(
                  'Zeyad Ahmed',
                  style: TextStyle(
                      fontFamily: 'Dancing',
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'MOBILE DEVELOPER',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Source Sans',
                      letterSpacing: 1,
                      color: Colors.teal[900]),
                ),
                SizedBox(
                  height: 20,
                  width: 120,
                  child: Divider(color: Colors.teal[900]),
                ),
                //Container(
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child:
                          /* Row(children: [
                      Icon(Icons.contact_phone,color: Colors.teal[900]),
                      SizedBox(width: 20,),
                      Text('01110542957',style: TextStyle(color: Colors.teal[900],fontFamily: 'Source Sans'),)
                    ],),*/
                          //has its padding
                          ListTile(
                        leading:
                            Icon(Icons.contact_phone, color: Colors.teal[900]),
                        title: Text(
                          '01110542957',
                          style: TextStyle(
                              color: Colors.teal[900],
                              fontFamily: 'Source Sans'),
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                //Container(
                Card(
                  color: Colors.white,
                  // width: 250,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  //  padding: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: /*Row(
                      children: [
                        Icon(Icons.email, color: Colors.teal[900]),
                        SizedBox(
                          width: 20,
                        ),
                        Text('zeyadElkaluoby2020@gmail.com',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.teal[900],
                                fontFamily: 'Source Sans'))
                      ],
                    )*/
                    ListTile(leading: Icon(Icons.email, color: Colors.teal[900]),
                        title:Text('zeyadElkaluoby2020@gmail.com',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.teal[900],
                                fontFamily: 'Source Sans')) ,),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
