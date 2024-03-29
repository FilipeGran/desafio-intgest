import 'package:desafio_intgest/src/models/userId.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task {
  String objectId;
  String nameTask;
  String description;
  String priority;
  UserId userId;
  bool finished;
  DateTime createdAt;
  DateTime updatedAt;

  Task({
    required this.objectId,
    required this.nameTask,
    required this.description,
    required this.priority,
    required this.userId,
    required this.finished,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        objectId: json["objectId"],
        nameTask: json["nameTask"],
        description: json["description"],
        priority: json["priority"],
        userId: UserId.fromJson(json["userId"]),
        finished: json["finished"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "objectId": objectId,
        "nameTask": nameTask,
        "description": description,
        "priority": priority,
        "userId": userId.toJson(),
        "finished": finished,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };

  @override
  String toString() {
    return 'Task(objectId: $objectId, nameTask: $nameTask, description: $description, priority: $priority, userId: $userId, finished: $finished, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
