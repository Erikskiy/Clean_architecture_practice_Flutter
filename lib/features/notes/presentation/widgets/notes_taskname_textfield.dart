import 'package:flutter/material.dart';

class NotesTasknameTextfield extends StatelessWidget{
  final TextEditingController taskNameController;
  const NotesTasknameTextfield({
    super.key,
    required this.taskNameController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: taskNameController,
      style: TextStyle(
        color: Colors.pink,
      ),
      decoration: InputDecoration(
        hintText: "Task name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.pink,
            width: 2.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.pink,
            width: 2.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.pink,
            width: 2.5,
          ),
        ),
      ),
    );
  }
}