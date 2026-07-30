import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_flutter/features/notes/domain/entities/notes_task_entity.dart';
import 'package:practice_flutter/features/notes/domain/usecases/notes_addtask_usecases.dart';
import 'package:practice_flutter/features/notes/domain/usecases/notes_completed_usecases.dart';
import 'package:practice_flutter/features/notes/domain/usecases/notes_deletetask_usecases.dart';
import 'package:practice_flutter/features/notes/domain/usecases/notes_getalltasks_usecases.dart';
import 'package:practice_flutter/features/notes/presentation/cubit/notes_state.dart';

class NotesCubit extends Cubit<NotesState>{
  final NotesAddtaskUsecases notesAddtaskUsecases;
  final NotesDeletetaskUsecases notesDeletetaskUsecases;
  final NotesGetalltasksUsecases notesGetalltasksUsecases;
  final NotesCompletedUsecases notesCompletedUsecases;

  NotesCubit({
    required this.notesAddtaskUsecases,
    required this.notesDeletetaskUsecases,
    required this.notesGetalltasksUsecases,
    required this.notesCompletedUsecases,
  }):super(NotesStateInit());

  Future<void> getalltasks() async {
    emit(NotesStateLoading());

    try{
      final tasks = await notesGetalltasksUsecases();
      emit(NotesStateLoaded(tasks: tasks));
    }
    catch(e){
      emit(NotesStateError(message: e.toString()));
    }
  }
  
  Future<void> deletetask(int index) async {
    notesDeletetaskUsecases(index);

    await getalltasks();
  }

  Future<void> completed(int index) async{
    notesCompletedUsecases(index);

    await getalltasks();
  }

  Future<void> addTask(NotesTaskEntity task) async{
    notesAddtaskUsecases(task);

    await getalltasks();
  }
}