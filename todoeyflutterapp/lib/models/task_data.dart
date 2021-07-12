import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'Task.dart';

class TaskData extends ChangeNotifier{
  List<Task> _tasks=[Task(name: 'task1'),
    Task(name: 'task2'),
    Task(name: 'task3')];

  int get taskCount
  {
return _tasks.length;
  }

  /*List<Task> getTasks()
  {
    return _tasks;
  }*/
  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }
  void addTask (String taskName)
  {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }
  void updateTask(Task task)
  {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(int inx)
  {
    _tasks.removeAt(inx);
    notifyListeners();
  }
}