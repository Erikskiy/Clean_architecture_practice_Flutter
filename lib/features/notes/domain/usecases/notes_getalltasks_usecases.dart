import 'package:practice_flutter/features/notes/data/models/notes_task_model.dart';
import '../repositories/notes_task_repositories.dart';

class NotesGetalltasksUsecases {
  final NotesTaskRepositories notesTaskRepositories;

  NotesGetalltasksUsecases({required this.notesTaskRepositories});

  Future<List<NotesTaskModel>> call(){
    return notesTaskRepositories.getAllTasks();
  }
}