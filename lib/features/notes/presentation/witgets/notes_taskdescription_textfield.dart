import 'package:flutter/material.dart';

class NotesTaskdescriptionTextfield extends StatelessWidget{
  final TextEditingController taskDescriptionController;

  const NotesTaskdescriptionTextfield({
    super.key,
    required this.taskDescriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: taskDescriptionController,
      style: TextStyle(
        color: Colors.pink,
      ),
      decoration: InputDecoration(
        hintText: "Task description",
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