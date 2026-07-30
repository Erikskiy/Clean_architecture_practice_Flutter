import 'package:practice_flutter/features/notes/domain/repositories/notes_task_repositories.dart';

class NotesCompletedUsecases {
  final NotesTaskRepositories notesTaskRepositories;

  NotesCompletedUsecases({
    required this.notesTaskRepositories,
  });

  void call(int index){
    notesTaskRepositories.completed(index);
  }
}