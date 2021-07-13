import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:openapiapp/post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Post> fetchPost() async {
    final response =  await http.get(Uri.parse('http://api.open-notify.org/astros'));

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      ),
    body: Center(
    child: Column(
      children: [
        Expanded(
          child: FutureBuilder<Post>(
          future: fetchPost(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("Number of people in space: ${snapshot.data!.number}");
                }
               else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
  },
  ),
        ),
          Expanded(
            flex: 4,
            child: FutureBuilder<Post>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.number,
                    itemBuilder: (context,index){
                      return ListTile(
                          title: Text(snapshot.data!.people![index]['name']),
                      subtitle: Text(snapshot.data!.people![index]['craft'],
                      ));
                    });
              }
              else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
        ),
          ), ],
    ),
  ),

    );
  }
}
