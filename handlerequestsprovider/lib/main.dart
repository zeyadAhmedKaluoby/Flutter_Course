import 'package:flutter/material.dart';
import 'package:handlerequestsprovider/Screens/provider_class.dart';
import 'package:provider/provider.dart';

import 'Screens/provider_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderClass>(create: (context)=>ProviderClass())
      ],
      child: MaterialApp(
        title: 'post provider',

        home: PostProviderScreen(),
      ),
    );
  }
}

