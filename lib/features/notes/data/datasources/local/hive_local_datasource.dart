import 'package:hive/hive.dart';
import 'package:practice_flutter/features/notes/data/models/notes_task_model.dart';

class HiveLocalDatasource {
  final hive = Hive.box("notes");

  Future<List<NotesTaskModel>> getAllTasks() async {
    final value = await hive.values.toList();
    return value.map((e) => NotesTaskModel.fromHive(Map<String, dynamic>.from(e))).toList();
  }

  void addTask(NotesTaskModel model){
    hive.add(model.toHive());
  }

  void deleteTask(int index){
    hive.deleteAt(index);
  }

  void completed(int index){
    final taskOld = NotesTaskModel.fromHive(Map<String, dynamic>.from(hive.getAt(index)));
    final taskNow = NotesTaskModel(
      taskName: taskOld.taskName,
      taskDescription: taskOld.taskDescription,
      isCompleted: taskOld.isCompleted == false ? true : false,
    );
    hive.putAt(index, taskNow.toHive());
  }
}