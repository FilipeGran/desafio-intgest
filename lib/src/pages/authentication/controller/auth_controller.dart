// ignore_for_file: avoid_print

import 'package:desafio_intgest/src/models/user.dart';
import 'package:desafio_intgest/src/pages/authentication/authentication_repository/auth_repository.dart';
import 'package:desafio_intgest/src/services/util_services.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  final authRepository = AuthRepository();
  final utilService = UtilService();

  Future<bool> signIn({required User user}) async {
    bool result = await authRepository.singIn(user: user);

    if (result) {
      utilService.showToast(message: 'Cadastro realizado com sucesso!');
      return true;
    } else {
      utilService.showToast(
        message: 'Ocorreu um Erro ao realizar o seu cadastro',
        isError: true,
      );
      return false;
    }
  }

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    bool result = await authRepository.login(
      username: username,
      password: password,
    );

    if (result) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> isLogged() async {
    final token = await utilService.getLocalData(key: 'token');
    if (token == null || token.isEmpty) {
      return false;
    } else {
      final response = await authRepository.recoverCurrentUser(token: token);
      print(response);

      if (response != null) {
        return true;
      } else {
        utilService.removeLocalData(key: 'token');
        utilService.removeLocalData(key: 'objectId');
        return false;
      }
    }
  }

  Future<bool> logout() async {
    final token = await utilService.getLocalData(key: 'token');

    final response = await authRepository.logout(token: token!);

    if (response) {
      utilService.removeLocalData(key: 'token');
      return true;
    } else {
      return false;
    }
  }
}
