// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:desafio_intgest/src/models/task.dart';
import 'package:flutter/material.dart';

Tasks TasksFromJson(String str) => Tasks.fromJson(json.decode(str));

String TasksToJson(Tasks data) => json.encode(data.toJson());

class Tasks with ChangeNotifier {
  List<Task> task;

  Tasks({
    required this.task,
  });

  factory Tasks.fromJson(Map<dynamic, dynamic> json) => Tasks(
        task: List<Task>.from(json["results"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "task": List<dynamic>.from(task.map((x) => x.toJson())),
      };

  bool removeItem(Task taskRemove) {
    bool result = task.remove(taskRemove);
    notifyListeners();
    return result;
  }
}
