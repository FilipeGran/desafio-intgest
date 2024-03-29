// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:desafio_intgest/src/config/custom_colors.dart';
import 'package:desafio_intgest/src/pages/authentication/controller/auth_controller.dart';
import 'package:desafio_intgest/src/pages/commom_widgets/custom_text_form_field.dart';
import 'package:desafio_intgest/src/pages_routes/routes.dart';
import 'package:desafio_intgest/src/services/util_services.dart';
import 'package:desafio_intgest/src/utils/validators_forms.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final validatorsForms = ValidatorForms();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final utilService = UtilService();
  final authController = AuthController();

  @override
  void initState() {
    super.initState();
    testLogged();
  }

  Future<void> testLogged() async {
    bool response = await authController.isLogged();
    if (response) {
      Navigator.pushNamedAndRemoveUntil(context, Routes.BASE, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            CustomTextFormField(
              icon: Icons.email_outlined,
              text: 'Email',
              label: 'Email',
              validator: validatorsForms.emailValidator,
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            CustomTextFormField(
              icon: Icons.lock,
              text: 'Senha',
              label: 'Senha',
              validator: validatorsForms.passwordValidator,
              keyboardType: TextInputType.visiblePassword,
              controller: _passwordController,
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () async {
                    print(await utilService.getLocalData(key: 'token'));
                  },
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: Colors.red.shade400, fontSize: 14),
                  ),
                ),
              ),
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
                  final validate = _formKey.currentState!.validate();

                  if (validate) {
                    bool result = await authController.login(
                      username: _emailController.text,
                      password: _passwordController.text,
                    );

                    if (result) {
                      utilService.showToast(
                          message: 'Login realizado com Sucesso!');
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.BASE,
                        (route) => false,
                      );
                    } else {
                      utilService.showToast(
                        message: 'Email ou Senha Incorreto!',
                        isError: true,
                      );
                    }
                  }
                },
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'ou',
              style: TextStyle(fontSize: 16),
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
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.CREATEACCOUNT);
                },
                child: const Text(
                  'Criar Conta',
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
