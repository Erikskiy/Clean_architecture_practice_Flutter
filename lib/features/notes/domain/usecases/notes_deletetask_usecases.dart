
import '../repositories/notes_task_repositories.dart';

class NotesDeletetaskUsecases {
  final NotesTaskRepositories notesTaskRepositories;

  NotesDeletetaskUsecases({required this.notesTaskRepositories});

  void call(int index){
    notesTaskRepositories.deleteTask(index);
  }
}