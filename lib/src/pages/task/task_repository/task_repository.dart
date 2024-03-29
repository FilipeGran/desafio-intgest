// ignore_for_file: unused_field, avoid_print
import 'package:desafio_intgest/src/constants/endpoints.dart';
import 'package:desafio_intgest/src/models/task.dart';
import 'package:desafio_intgest/src/models/tasks.dart';
import 'package:desafio_intgest/src/services/http_manager.dart';
import 'package:desafio_intgest/src/services/http_method.dart';
import 'package:desafio_intgest/src/services/util_services.dart';

class TaskRepository {
  final _httpManager = HttpManager();
  final _utilService = UtilService();

  Future<bool> newTask({
    required String nameTask,
    required String description,
    required String priority,
    required String token,
    required Map<String, String> userId,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.newTask,
      method: HttpMethod.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
      body: {
        'nameTask': nameTask,
        'description': description,
        'priority': priority,
        'userId': userId,
      },
    );
    if (result['objectId'] != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Task>?> getTasksByUserId({
    required String token,
    required String type,
    required String classNames,
    required String objectId,
  }) async {
    final result = await _httpManager.restRequest(
        url:
            '${Endpoints.newTask}?where={"userId": { "__type": "$type", "className": "$classNames", "objectId": "$objectId"}}',
        method: HttpMethod.get,
        headers: {
          'X-Parse-Session-Token': token,
        });

    final tasks = Tasks.fromJson(result);
    if (tasks.task.isNotEmpty) {
      return tasks.task;
    } else {
      return null;
    }
  }

  Future<bool> markFinished({
    required String token,
    required String objectId,
  }) async {
    final result = await _httpManager.restRequest(
      url: '${Endpoints.updateTask}/$objectId',
      method: HttpMethod.put,
      headers: {
        "X-Parse-Session-Token": token,
      },
      body: {
        "finished": true,
      },
    );

    if (result['updatedAt'] != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateTask({
    required String token,
    required Task task,
  }) async {
    final result = await _httpManager.restRequest(
      url: '${Endpoints.updateTask}/${task.objectId}',
      method: HttpMethod.put,
      headers: {
        "X-Parse-Session-Token": token,
      },
      body: {
        "nameTask": task.nameTask,
        "description": task.description,
        "priority": task.priority
      },
    );

    if (result['updatedAt'] != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteTask({
    required String token,
    required String objectId,
  }) async {
    final result = await _httpManager.restRequest(
      url: '${Endpoints.deleteTask}/$objectId',
      method: HttpMethod.delete,
      headers: {
        "X-Parse-Session-Token": token,
      },
    );
    if (result['error'] == null) {
      return true;
    } else {
      return false;
    }
  }
}
