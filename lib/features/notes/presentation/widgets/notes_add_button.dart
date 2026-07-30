import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_flutter/features/notes/data/models/notes_task_model.dart';
import 'package:practice_flutter/features/notes/presentation/cubit/notes_cubit.dart';

class NotesAddButton extends StatelessWidget{
  final TextEditingController taskNameController;
  final TextEditingController taskDescriptionController;

  const NotesAddButton({
    super.key,
    required this.taskNameController,
    required this.taskDescriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return  TextButton(
      onPressed: () {
        final task = NotesTaskModel(
          taskName: taskNameController.text,
          taskDescription: taskDescriptionController.text,
          isCompleted: false,
        );
        context.read<NotesCubit>().addTask(task);
      },
      child: Text(
        "Add",
        style: TextStyle(
          color: Colors.pink,
        ),
      ),
    );
  }
}