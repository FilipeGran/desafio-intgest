// ignore_for_file: unused_field, unused_import, use_build_context_synchronously

import 'package:desafio_intgest/src/config/custom_colors.dart';
import 'package:desafio_intgest/src/models/task.dart';
import 'package:desafio_intgest/src/pages/commom_widgets/custom_text_form_field.dart';
import 'package:desafio_intgest/src/pages/task/controller/task_controller.dart';
import 'package:desafio_intgest/src/pages_routes/routes.dart';
import 'package:desafio_intgest/src/services/util_services.dart';
import 'package:desafio_intgest/src/utils/validators_forms.dart';
import 'package:flutter/material.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;
  const EditTaskScreen({
    super.key,
    required this.task,
  });

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final validatiorForm = ValidatorForms();
  final _formKey = GlobalKey<FormState>();
  final _taskController = TaskController();
  final _utilService = UtilService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Editar Tarefa',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: CustomCorlors.customColorPurple,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              icon: Icons.task,
              text: 'Tarefa',
              label: 'Tarefa',
              keyboardType: TextInputType.text,
              validator: validatiorForm.textValidator,
              initialValue: widget.task.nameTask,
              onSaved: (input) {
                if (input != null) {
                  widget.task.nameTask = input;
                }
              },
            ),
            CustomTextFormField(
              icon: Icons.description,
              text: 'Descrição',
              label: 'Descrição',
              keyboardType: TextInputType.text,
              validator: validatiorForm.textValidator,
              initialValue: widget.task.description,
              onSaved: (input) {
                if (input != null) {
                  widget.task.description = input;
                }
              },
            ),
            CustomTextFormField(
              icon: Icons.priority_high,
              text: 'Prioridade',
              label: 'Prioridade',
              keyboardType: TextInputType.text,
              validator: validatiorForm.textValidator,
              initialValue: widget.task.priority,
              onSaved: (input) {
                if (input != null) {
                  widget.task.priority = input;
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 360,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomCorlors.customColorPurple,
                  padding: const EdgeInsets.all(0),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    final result = await _taskController.updateTask(
                      task: widget.task,
                    );

                    if (result) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.BASE,
                        (route) => false,
                      );
                    }
                  }
                },
                child: const Text(
                  'Atualizar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
