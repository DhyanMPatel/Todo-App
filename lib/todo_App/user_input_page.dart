import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {

  // text editing controller to get access to what the use typed
  TextEditingController myController = TextEditingController();

  // O U T P U T   M E S S A G E
  String outputMessage="";

  /// S U B M I T - B U T T O N
  void submitButton(){
    String userName = myController.text;
    setState(() {
      outputMessage = "Hello, $userName!";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(outputMessage),
              TextField(
                controller: myController,
                
                decoration: const InputDecoration(border: OutlineInputBorder(),hintText:"Enter Your Name :"),
              ),
              ElevatedButton(onPressed: submitButton, child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}