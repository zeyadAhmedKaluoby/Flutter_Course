import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutterapp/models/task_data.dart';
import 'package:todoeyflutterapp/screens/add_task.dart';
import 'package:todoeyflutterapp/widgets/task_list.dart';

class TaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
          elevation: 5,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => SingleChildScrollView(
                      child: Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: AddTaskScreen(/*onsPressFun: (tex){

                           //   Provider.of<TaskData>(context).tasks.add(Task(name: tex.toString()));

                            Navigator.pop(context);*/

                          )),
                    ),
                isScrollControlled: false);
          },
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 60,
                right: 30,
                left: 30,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child: Icon(
                        Icons.list,
                        size: 40,
                        color: Colors.lightBlueAccent,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount} tasks',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )
                  // ListView(children: [],)
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: Colors.white),
                child: TasksList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
