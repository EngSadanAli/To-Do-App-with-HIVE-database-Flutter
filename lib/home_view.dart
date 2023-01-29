import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/utils/App%20Images/app_images.dart';
import 'package:to_do_app/utils/dialog_box.dart';

import 'package:to_do_app/utils/to_do_tile.dart';

class HomeViw extends StatefulWidget {
  const HomeViw({super.key});

  @override
  State<HomeViw> createState() => _HomeViwState();
}

class _HomeViwState extends State<HomeViw> {
  //refrence the Hive
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();
  //Text Controller
  final _controller = TextEditingController();

  @override
  void initState() {
    // if this is the ist time opning the app, then the create default data
    if (_myBox.get("TODOLIST") == null) {
      db.creatInitialData();
    } else {
      // if there already Exists data
      db.loadData();
    }

    super.initState();
  }

  // To do Task
  // List toDoList = [
  //   ["Let's Code", false],
  //   ["Walk Time", false],
  // ];

  //Checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

// save method
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete Task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "To Do",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Image.asset(
                AppImage.logo,
                height: 40,
              )
            ],
          )),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: ((context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          })),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: createNewTask),
    );
  }
}
