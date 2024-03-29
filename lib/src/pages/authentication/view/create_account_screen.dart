// ignore_for_file: use_build_context_synchronously

import 'package:desafio_intgest/src/config/custom_colors.dart';
import 'package:desafio_intgest/src/models/user.dart';
import 'package:desafio_intgest/src/pages/authentication/controller/auth_controller.dart';
import 'package:desafio_intgest/src/pages/commom_widgets/custom_text_form_field.dart';
import 'package:desafio_intgest/src/pages_routes/routes.dart';
import 'package:desafio_intgest/src/services/util_services.dart';
import 'package:desafio_intgest/src/utils/validators_forms.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  final utilService = UtilService();
  final _formKey = GlobalKey<FormState>();
  final validatorForms = ValidatorForms();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmedController = TextEditingController();
  final _authController = AuthController();
  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cadastro',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                icon: Icons.person,
                text: 'Nome Completo',
                label: 'Nome Completo',
                validator: validatorForms.nameValidator,
                controller: _nameController,
              ),
              CustomTextFormField(
                icon: Icons.email_outlined,
                text: 'Email',
                label: 'Email',
                validator: validatorForms.emailValidator,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ),
              CustomTextFormField(
                icon: Icons.phone,
                text: 'Telefone',
                label: 'Telefone',
                validator: validatorForms.phoneValidator,
                inputFormatters: [phoneFormatter],
                controller: _phoneController,
              ),
              CustomTextFormField(
                icon: Icons.lock,
                text: 'Senha',
                label: 'Senha',
                obscureText: true,
                validator: validatorForms.passwordValidator,
                controller: _passwordController,
              ),
              CustomTextFormField(
                icon: Icons.lock,
                text: 'Confirmar Senha',
                label: 'Confirmar Senha',
                obscureText: true,
                validator: validatorForms.passwordValidator,
                controller: _passwordConfirmedController,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomCorlors.customColorPurple,
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (_passwordController.text ==
                          _passwordConfirmedController.text) {
                        User user = User(
                          userName: _emailController.text,
                          email: _emailController.text,
                          name: _nameController.text,
                          phone: _phoneController.text,
                          password: _passwordController.text,
                        );
                        bool result = await _authController.signIn(user: user);
                        if (result) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.BASE, (route) => false);
                        }
                      } else {
                        utilService.showToast(
                            message: 'As senhas não conferem', isError: true);
                      }
                    }
                  },
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
