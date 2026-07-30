import 'package:practice_flutter/features/notes/domain/entities/notes_task_entity.dart';

abstract class NotesState {}

class NotesStateInit extends NotesState{}

class NotesStateLoading extends NotesState{}

class NotesStateLoaded extends NotesState{
  final List<NotesTaskEntity> tasks;

  NotesStateLoaded({
    required this.tasks,
  });
}

class NotesStateError extends NotesState{
  final String message;

  NotesStateError({
    required this.message,
  });
}

class NotesStateCompleted extends NotesState{}
