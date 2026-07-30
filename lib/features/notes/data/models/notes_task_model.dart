import 'package:practice_flutter/features/notes/domain/entities/notes_task_entity.dart';

class NotesTaskModel extends NotesTaskEntity{
  NotesTaskModel({
    required super.taskName,
    required super.taskDescription,
    required super.isCompleted,
  });

  factory NotesTaskModel.fromHive(Map<String, dynamic> json){
    return NotesTaskModel(
        taskName: json["taskName"],
        taskDescription: json["description"],
        isCompleted: json["isCompleted"],
    );
  }

  Map<String, dynamic> toHive(){
    return {
      "taskName": taskName,
      "description": taskDescription,
      "isCompleted": isCompleted,
    };
  }
}