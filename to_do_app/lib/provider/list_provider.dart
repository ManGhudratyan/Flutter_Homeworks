import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  List<String> todonames = [
    'Do Math Homework',
    'Tack out dogs',
    'Business meeting with CEO',
    'Buy Grocery'
  ];
  List<String> todotimes = [
    'Today At 16:45',
    'Today At 18:20',
    'Today At 08:15',
    'Today At 16:45'
  ];
  List<String> completedTasks = [];

  List<String> getToDoName() => todonames;

  List<String> getToDoTime() => todotimes;

  List<String> getCompletedTasks() => completedTasks;

  void addToDo(String name) {
    todonames.add(name);
    notifyListeners();
  }

  void markAsCompleted(int index) {
    completedTasks.add(todonames[index]);
    completedTasks.add(todotimes[index]);
    deleteTask(index);
    notifyListeners();
  }

  void deleteTask(int index) {
    todonames.removeAt(index);
    todotimes.removeAt(index);
    notifyListeners();
  }
}
