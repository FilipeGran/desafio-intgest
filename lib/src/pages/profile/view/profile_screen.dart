// ignore_for_file: avoid_print

import 'package:desafio_intgest/src/config/custom_colors.dart';
import 'package:desafio_intgest/src/models/user.dart';
import 'package:desafio_intgest/src/pages/commom_widgets/custom_text_form_field.dart';
import 'package:desafio_intgest/src/pages/profile/controller/profile_controller.dart';
import 'package:desafio_intgest/src/services/util_services.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User user = User();
  final profileController = ProfileController();
  final utilService = UtilService();
  bool loadFinisher = false;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    final result = await profileController.getUser();

    if (result != null) {
      user = result;
      setState(() {
        loadFinisher = true;
      });
    } else {
      utilService.showToast(
        message: 'Erro ao Carregar os dados',
        isError: true,
      );
    }
    setState(() {
      loadFinisher = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Dados do Usuário',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: CustomCorlors.customColorPurple,
      ),
      body: loadFinisher
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  icon: Icons.person,
                  text: 'nome',
                  label: 'nome',
                  initialValue: user.name,
                  readOnly: true,
                ),
                CustomTextFormField(
                  icon: Icons.email,
                  text: 'email',
                  label: 'email',
                  initialValue: user.userName,
                  readOnly: true,
                ),
                CustomTextFormField(
                  icon: Icons.phone,
                  text: 'telefone',
                  label: 'telefone',
                  initialValue: user.phone,
                  readOnly: true,
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
