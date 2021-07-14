import 'package:flutter/material.dart';
import 'package:handlerequestsprovider/Screens/provider_class.dart';
import 'package:provider/provider.dart';

class PostProviderScreen extends StatefulWidget {
  @override
  _PostProviderScreen createState() => _PostProviderScreen();
}

class _PostProviderScreen extends State<PostProviderScreen> {
  @override
  void initState() {
    final postModel = Provider.of<ProviderClass>(context, listen: false);
    postModel.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<ProviderClass>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: postMdl.loading
              ? CircularProgressIndicator()
              : ListTile(
                  title: Text(
                    postMdl.post.title ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text(
                    postMdl.post.body ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),
                  ),
                )),
    );
  }
}
