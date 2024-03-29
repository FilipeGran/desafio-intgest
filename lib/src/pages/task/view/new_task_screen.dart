// ignore_for_file: use_build_context_synchronously

import 'package:desafio_intgest/src/config/custom_colors.dart';
import 'package:desafio_intgest/src/pages/commom_widgets/custom_text_form_field.dart';
import 'package:desafio_intgest/src/pages/task/controller/task_controller.dart';
import 'package:desafio_intgest/src/pages_routes/routes.dart';
import 'package:desafio_intgest/src/services/util_services.dart';
import 'package:desafio_intgest/src/utils/validators_forms.dart';
import 'package:flutter/material.dart';

class NewTaskScreen extends StatelessWidget {
  NewTaskScreen({super.key});

  final validatiorForm = ValidatorForms();
  final _formKey = GlobalKey<FormState>();
  final _nameTaskController = TextEditingController();
  final _descriptionTaskController = TextEditingController();
  final _priorytiTaskController = TextEditingController();
  final _taskController = TaskController();
  final _utilService = UtilService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Nova Tarefa',
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
              controller: _nameTaskController,
            ),
            CustomTextFormField(
              icon: Icons.description,
              text: 'Descrição',
              label: 'Descrição',
              keyboardType: TextInputType.text,
              validator: validatiorForm.textValidator,
              controller: _descriptionTaskController,
            ),
            CustomTextFormField(
              icon: Icons.priority_high,
              text: 'Prioridade',
              label: 'Prioridade',
              keyboardType: TextInputType.text,
              validator: validatiorForm.textValidator,
              controller: _priorytiTaskController,
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
                    final result = await _taskController.newTask(
                      nameTask: _nameTaskController.text,
                      description: _descriptionTaskController.text,
                      priority: _priorytiTaskController.text,
                    );

                    if (result) {
                      _utilService.showToast(
                          message: 'Tarefa Criada com Sucesso!');
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.BASE,
                        (route) => false,
                      );
                    } else {
                      _utilService.showToast(
                          message: 'Erro ao criar tarefa', isError: true);
                    }
                  }
                },
                child: const Text(
                  'Cadastrar',
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
