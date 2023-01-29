import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  //refrence our box
  final _myBox = Hive.box('mybox');
  // run this method if this is the ist time ever opening this app
  void creatInitialData() {
    toDoList = [
      ["Do Exercise", false]
    ];
  }
 
  // load data from dataBase
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  //update Database
  void updateDataBase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
