import 'package:practice_flutter/features/notes/data/datasources/local/hive_local_datasource.dart';
import 'package:practice_flutter/features/notes/data/models/notes_task_model.dart';
import '../../domain/entities/notes_task_entity.dart';
import '../../domain/repositories/notes_task_repositories.dart';

class NotesTaskRepositoriesImpl extends NotesTaskRepositories{
  final HiveLocalDatasource hiveLocalDatasource;

  NotesTaskRepositoriesImpl({
   required this.hiveLocalDatasource
  });

  bool internet = false;
  @override
  Future<List<NotesTaskModel>> getAllTasks(){
    if(internet == false){
      return hiveLocalDatasource.getAllTasks();
    }
    else{
      return hiveLocalDatasource.getAllTasks();
    }
  }

  @override
  void addTask(NotesTaskEntity task) {
    if(internet == false){
      final model = NotesTaskModel(
          taskName: task.taskName,
          taskDescription: task.taskDescription,
          isCompleted: task.isCompleted
      );
      hiveLocalDatasource.addTask(model);
    }
  }

  @override
  void deleteTask(int index) {
    if(internet == false){
      hiveLocalDatasource.deleteTask(index);
    }
  }

  @override
  void completed(int index) {
    if(internet == false){
      hiveLocalDatasource.completed(index);
    }
  }
}