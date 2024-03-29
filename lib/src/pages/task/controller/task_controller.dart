// ignore_for_file: avoid_print

import 'package:desafio_intgest/src/models/task.dart';
import 'package:desafio_intgest/src/models/tasks.dart';
import 'package:desafio_intgest/src/pages/task/task_repository/task_repository.dart';
import 'package:desafio_intgest/src/services/util_services.dart';
import 'package:flutter/material.dart';

class TaskController extends ChangeNotifier {
  final _utilService = UtilService();
  final taskRepository = TaskRepository();
  Tasks tasks = Tasks(task: []);

  Future<bool> newTask({
    required String nameTask,
    required String description,
    required String priority,
  }) async {
    final token = await _utilService.getLocalData(key: 'token');
    final objectId = await _utilService.getLocalData(key: 'objectId');
    if (token == null ||
        token.isEmpty ||
        objectId == null ||
        objectId.isEmpty) {
      return false;
    } else {
      final result = await taskRepository.newTask(
          nameTask: nameTask,
          description: description,
          priority: priority,
          token: token,
          userId: {
            "__type": "Pointer",
            "className": "_User",
            "objectId": objectId
          });

      if (result) {
        return true;
      } else {
        _utilService.showToast(message: 'Erro ao criar tarefa', isError: true);
        return false;
      }
    }
  }

  Future<void> getTasksByUserId() async {
    final token = await _utilService.getLocalData(key: 'token');
    final objectId = await _utilService.getLocalData(key: 'objectId');

    if (token == null ||
        token.isEmpty ||
        objectId == null ||
        objectId.isEmpty) {
    } else {
      final result = await taskRepository.getTasksByUserId(
        token: token,
        type: 'Pointer',
        classNames: '_User',
        objectId: objectId,
      );

      if (result != null) {
        tasks.task = result;
        notifyListeners();
      } else {
        //_utilService.showToast(message: 'Erro ao Carregar Tarefas');
      }
    }
  }

  Future<void> markFinished(
      {required String objectId, required Task task}) async {
    final token = await _utilService.getLocalData(key: 'token');

    if (token == null || token.isEmpty) {
      _utilService.showToast(
        message: 'Erro ao atualizar!',
        isError: true,
      );
    } else {
      final result = await taskRepository.markFinished(
        token: token,
        objectId: objectId,
      );

      if (result) {
      } else {
        _utilService.showToast(
          message: 'Erro ao Atualizar!',
          isError: true,
        );
      }
    }
  }

  Future<bool> updateTask({required Task task}) async {
    final token = await _utilService.getLocalData(key: 'token');

    if (token == null || token.isEmpty) {
      _utilService.showToast(
        message: 'Erro ao atualizar!',
        isError: true,
      );
      return false;
    } else {
      final result = await taskRepository.updateTask(
        token: token,
        task: task,
      );

      if (result) {
        _utilService.showToast(message: 'Atualizado Com Sucesso!');
        return true;
      } else {
        _utilService.showToast(
          message: 'Erro ao Atualizar!',
          isError: true,
        );
        return false;
      }
    }
  }

  Future<void> deleteTask(
      {required String objectId, required Task task}) async {
    final token = await _utilService.getLocalData(key: 'token');
    if (token == null || token.isEmpty) {
      _utilService.showToast(
        message: 'Erro ao excluír!',
        isError: true,
      );
    } else {
      final result = await taskRepository.deleteTask(
        token: token,
        objectId: objectId,
      );

      if (result) {
        _utilService.showToast(message: 'Deletado com Sucesso!');
      } else {
        _utilService.showToast(message: 'Erro ao Deletar', isError: true);
      }
    }
  }
}
