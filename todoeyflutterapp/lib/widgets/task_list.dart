import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutterapp/models/task_data.dart';
import 'package:todoeyflutterapp/widgets/task_tile.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taskData,child){
       return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              longPressCallback: (){
                taskData.removeTask(index);
              },
                isChecked: task.isDone,
                title: task.name,
                onChangedToggle: (bool? newValue) {
                  taskData.updateTask(task);
                  /*  setState(() {
          Provider.of<TaskData>(context).tasks[index].toggleDone();
        });*/
                });
          },
          itemCount: taskData.taskCount,
        );
      },

    );
  }
}
