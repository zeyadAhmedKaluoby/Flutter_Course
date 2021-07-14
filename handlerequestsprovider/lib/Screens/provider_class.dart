import 'package:flutter/material.dart';
import 'package:handlerequestsprovider/models/post_model.dart';
import 'package:handlerequestsprovider/network/network.dart';

class ProviderClass extends ChangeNotifier{
  PostModel post = PostModel();
  List<dynamic> posts=[];
  bool loading = false;
  void getData()async
  {
    loading = true;
    posts = await getPostData();
    loading=false;
    notifyListeners();
  }

}