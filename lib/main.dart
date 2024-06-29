/// T O D O   -   A P P
import 'package:flutter/material.dart';
import 'package:todo_app/todo_App/todo_app.dart';


void main() {

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoAppPage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}