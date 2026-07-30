import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_flutter/features/notes/data/datasources/local/hive_local_datasource.dart';
import 'package:practice_flutter/features/notes/data/repositories/notes_task_repositories_impl.dart';
import 'package:practice_flutter/features/notes/domain/usecases/notes_addtask_usecases.dart';
import 'package:practice_flutter/features/notes/domain/usecases/notes_completed_usecases.dart';
import 'package:practice_flutter/features/notes/domain/usecases/notes_deletetask_usecases.dart';
import 'package:practice_flutter/features/notes/domain/usecases/notes_getalltasks_usecases.dart';
import 'package:practice_flutter/features/notes/presentation/cubit/notes_cubit.dart';
import 'package:practice_flutter/features/notes/presentation/witgets/notes_add_button.dart';
import 'package:practice_flutter/features/notes/presentation/witgets/notes_taskdescription_textfield.dart';
import 'package:practice_flutter/features/notes/presentation/witgets/notes_tasklist_blocbuilder.dart';
import 'package:practice_flutter/features/notes/presentation/witgets/notes_taskname_textfield.dart';

class NotesPage extends StatelessWidget{
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskNameController = TextEditingController();
    final TextEditingController taskDescriptionController = TextEditingController();

    final hiveLocalDatasource= HiveLocalDatasource();
    final notesTaskRepositoriesImpl = NotesTaskRepositoriesImpl(hiveLocalDatasource: hiveLocalDatasource);

    final notesGetalltasksUsecases = NotesGetalltasksUsecases(notesTaskRepositories: notesTaskRepositoriesImpl);
    final notesDeletetaskUsecases = NotesDeletetaskUsecases(notesTaskRepositories: notesTaskRepositoriesImpl);
    final notesCompletedUsecases = NotesCompletedUsecases(notesTaskRepositories: notesTaskRepositoriesImpl);
    final notesAddtaskUsecases = NotesAddtaskUsecases(notesTaskRepositories: notesTaskRepositoriesImpl)
;
    return BlocProvider(
      create: (context) => NotesCubit(
        notesAddtaskUsecases: notesAddtaskUsecases,
        notesDeletetaskUsecases: notesDeletetaskUsecases,
        notesGetalltasksUsecases: notesGetalltasksUsecases,
        notesCompletedUsecases: notesCompletedUsecases,
      )..getalltasks(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
              child: Column(
                children: [
                  NotesTasknameTextfield(taskNameController: taskNameController,),

                  SizedBox(
                    height: 10,
                  ),

                  NotesTaskdescriptionTextfield(taskDescriptionController: taskDescriptionController,),

                  SizedBox(
                    height: 10,
                  ),

                  NotesAddButton(taskNameController: taskNameController, taskDescriptionController: taskDescriptionController,),

                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: NotesTasklistBlocbuilder(),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}