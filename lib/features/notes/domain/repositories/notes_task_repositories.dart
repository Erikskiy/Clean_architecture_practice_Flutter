
import 'package:practice_flutter/features/notes/data/models/notes_task_model.dart';
import '../entities/notes_task_entity.dart';

abstract class NotesTaskRepositories {
  Future<List<NotesTaskModel>> getAllTasks();

  void addTask(NotesTaskEntity task);

  void deleteTask(int index);

  void completed(int index);
}