// ignore_for_file: avoid_print

import 'package:desafio_intgest/src/constants/endpoints.dart';
import 'package:desafio_intgest/src/models/user.dart';
import 'package:desafio_intgest/src/services/http_manager.dart';
import 'package:desafio_intgest/src/services/http_method.dart';
import 'package:desafio_intgest/src/services/util_services.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();
  final UtilService utilService = UtilService();

  Future<bool> singIn({required User user}) async {
    final result = await _httpManager
        .restRequest(url: Endpoints.signin, method: HttpMethod.post, body: {
      "email": user.email,
      "username": user.email,
      "phone": user.phone,
      "password": user.password,
      "name": user.name
    });

    print(result);

    if (result['sessionToken'] != null) {
      utilService.saveLocalData(key: 'token', value: result['sessionToken']);
      utilService.saveLocalData(key: 'objectId', value: result['objectId']);
      return true;
    } else {
      return false;
    }
  }

  Future<User?> recoverCurrentUser({required String token}) async {
    if (token.isNotEmpty) {
      final result = await _httpManager.restRequest(
        url: Endpoints.currentUser,
        method: HttpMethod.get,
        headers: {
          "X-Parse-Session-Token": token,
        },
      );

      if (result['error'] == null) {
        return User.fromMap(result);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final result = await _httpManager.restRequest(
      url:
          '${Endpoints.login}?username=$username&password=${password.toString()}',
      method: HttpMethod.post,
      headers: {
        "X-Parse-Revocable-Session": '1',
      },
    );
    if (result['sessionToken'] != null) {
      utilService.saveLocalData(key: 'token', value: result['sessionToken']);
      utilService.saveLocalData(key: 'objectId', value: result['objectId']);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> logout({required String token}) async {
    if (token.isNotEmpty) {
      final result = await _httpManager.restRequest(
        url: Endpoints.logout,
        method: HttpMethod.post,
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
    return false;
  }
}
