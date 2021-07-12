import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutterapp/models/Task.dart';
import 'package:todoeyflutterapp/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
 // final Function(String? tex) onsPressFun;
  //AddTaskScreen({required this.onsPressFun});
  String ?text='' ;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                'Add Task',
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  text = value;
                  print(text);
                },
              ),
              FlatButton(
                onPressed://onsPressFun(text)
               // (){onsPressFun(text);},
                (){
                  //final Task task = Task(name: text.toString());
                  //Provider.of<TaskData>(context,listen: false).tasks.add(task);
                 Provider.of<TaskData>(context,listen: false).addTask(text.toString());

                  Navigator.pop(context);
                }
                ,child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.lightBlueAccent,
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50),
            )),
      ),
    );
  }
}
