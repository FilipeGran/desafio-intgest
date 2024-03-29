import 'package:desafio_intgest/src/config/custom_colors.dart';
import 'package:desafio_intgest/src/models/task.dart';
import 'package:desafio_intgest/src/pages/task/controller/task_controller.dart';
import 'package:desafio_intgest/src/pages/task/view/edit_task_screen.dart';
import 'package:desafio_intgest/src/pages_routes/routes.dart';
import 'package:desafio_intgest/src/services/util_services.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  const TaskItem({super.key, required this.task});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  final utilService = UtilService();
  final taskController = TaskController();

  @override
  void initState() {
    super.initState();
    taskController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListTile(
        leading: widget.task.finished == true
            ? IconButton(
                icon: const Icon(Icons.check),
                color: Colors.green,
                onPressed: () =>
                    utilService.showToast(message: 'Tarefa Concluída!'),
              )
            : IconButton(
                icon: const Icon(Icons.cancel_outlined),
                color: Colors.red,
                onPressed: () =>
                    utilService.showToast(message: 'Tarefa não Concluída!'),
              ),
        title: Text(
          widget.task.description,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          'Prioridade: ${widget.task.priority}',
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: CustomCorlors.customColorPurple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: widget.task.finished == false
                  ? () {
                      taskController.markFinished(
                        objectId: widget.task.objectId,
                        task: widget.task,
                      );
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.BASE,
                        (route) => false,
                      );
                    }
                  : () =>
                      utilService.showToast(message: 'Tarefa já Concluída!'),
              icon: const Icon(
                Icons.check_box_outlined,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                taskController.deleteTask(
                  objectId: widget.task.objectId,
                  task: widget.task,
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.BASE,
                  (route) => false,
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            widget.task.finished == false
                ? IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return EditTaskScreen(
                            task: widget.task,
                          );
                        },
                      ));
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: CustomCorlors.customColorPurple,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      utilService.showToast(message: 'Tarefa já Concluída!');
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: CustomCorlors.customColorPurple,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
