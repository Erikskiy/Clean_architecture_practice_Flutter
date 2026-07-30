import '../entities/notes_task_entity.dart';
import '../repositories/notes_task_repositories.dart';

class NotesAddtaskUsecases {
  final NotesTaskRepositories notesTaskRepositories;

  NotesAddtaskUsecases({required this.notesTaskRepositories});

  void call(NotesTaskEntity task){
    return notesTaskRepositories.addTask(task);
  }
}