import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutterapp/models/task_data.dart';


class TaskTile extends StatelessWidget {
  final bool? isChecked ;
  final Function(bool?) onChangedToggle;
  final Function() longPressCallback;

  final String title;
TaskTile({required this.isChecked,required this.onChangedToggle,required this.title,required this.longPressCallback});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress:longPressCallback
      ,
      title: Text(
        title,
        style: TextStyle(
            decoration:
                !isChecked! ? TextDecoration.none : TextDecoration.lineThrough),
      ),
      trailing:  Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
         onChanged: onChangedToggle)
    );


  }
}

/*class TaskCheckbox extends StatelessWidget {
  final bool? checkboxState;
  final Function(bool?) onChangedToggle;
  TaskCheckbox({required this.checkboxState, required this.onChangedToggle});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: checkboxState,
        onChanged: onChangedToggle);
  }
}*/
