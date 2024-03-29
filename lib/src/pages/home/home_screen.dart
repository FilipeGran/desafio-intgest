// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:desafio_intgest/src/config/custom_colors.dart';
import 'package:desafio_intgest/src/pages/authentication/controller/auth_controller.dart';
import 'package:desafio_intgest/src/pages/home/components/task_item.dart';
import 'package:desafio_intgest/src/pages/task/controller/task_controller.dart';
import 'package:desafio_intgest/src/pages_routes/routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authController = AuthController();
  final taskController = TaskController();

  @override
  void initState() {
    super.initState();
    taskController.getTasksByUserId();
    taskController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tarefas',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: CustomCorlors.customColorPurple,
        actions: [
          IconButton(
            onPressed: () async {
              final bool result = await authController.logout();

              if (result) {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.Login, (route) => false);
              }
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.NEWTASK);
        },
        backgroundColor: CustomCorlors.customColorPurple,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: taskController.tasks.task.isEmpty
          ? const Center(
              child: Text(
                'Sem dados!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          : ListView.builder(
              itemCount: taskController.tasks.task.length,
              itemBuilder: (context, index) {
                return TaskItem(task: taskController.tasks.task[index]);
              },
            ),
    );
  }
}
