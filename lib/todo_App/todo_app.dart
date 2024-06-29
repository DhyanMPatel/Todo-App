// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/todo_App/dialog_box.dart';
import 'package:todo_app/todo_App/todo_tile.dart';

class ToDoAppPage extends StatefulWidget {
  const ToDoAppPage({super.key});

  @override
  State<ToDoAppPage> createState() => _ToDoAppPageState();
}

class _ToDoAppPageState extends State<ToDoAppPage> {
  // // reference the hive box
  // final _mybox = Hive.box('mybox');
  // TodoDataBase db = TodoDataBase();

  // @override
  // void initState(){

  //   // if this is the 1st time even opening the app, then create default data
  //   if(_mybox.get("TODOLIST")==null){
  //     db.createInitialDate();
  //   } else {
  //     //there already exists data
  //     db.loadData();
  //   }

  //   super.initState();
  // }

  /// List of ToDoList
  List toDoList = [
    ["List-1", false],
    ["List-2", false],
    ["List-2", false],
  ];

  final _controller = TextEditingController();

  // change the state of checkBox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
    // db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    // db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCencel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
    // db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Center(
          child: Text(
            "T O D O   A P P",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.grey[600],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[600],
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFuntion: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
