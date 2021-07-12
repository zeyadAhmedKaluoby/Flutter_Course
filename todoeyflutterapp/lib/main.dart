import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutterapp/models/task_data.dart';
import 'package:todoeyflutterapp/screens/task_screen.dart';

import 'models/Task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (BuildContext context) { return TaskData(); },
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
