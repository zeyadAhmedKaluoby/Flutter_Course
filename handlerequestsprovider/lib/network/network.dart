import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handlerequestsprovider/models/post_model.dart';
import 'package:http/http.dart' as http ;
/*
Future<PostModel> getPostData()async
{
   PostModel postModel=PostModel();
  try {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (response.statusCode == 200) {
      postModel = PostModel.fromJson(jsonDecode(response.body));
    } else {
      SnackBar(
          content: Text('Data not found'), backgroundColor: Colors.redAccent);
    }
  }catch(e)
  {
    print(e);
  }
  return postModel;
}
*/
Future<dynamic> getPostData()async
{
  List<dynamic> posts=[];
  PostModel postModel=PostModel();
  try {
    http.Response response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/'));
    if (response.statusCode == 200) {
      posts = jsonDecode(response.body);
      //print(posts[0]['title']);
     // postModel = PostModel.fromJson(jsonDecode(response.body));
    } else {
      SnackBar(
          content: Text('Data not found'), backgroundColor: Colors.redAccent);
    }
  }catch(e)
  {
    print(e);
  }
  return posts;
}
