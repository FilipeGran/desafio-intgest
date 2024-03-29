// ignore_for_file: avoid_print

import 'package:desafio_intgest/src/constants/endpoints.dart';
import 'package:desafio_intgest/src/models/user.dart';
import 'package:desafio_intgest/src/services/http_manager.dart';
import 'package:desafio_intgest/src/services/http_method.dart';
import 'package:desafio_intgest/src/services/util_services.dart';

class ProfileRepository {
  final _httpManager = HttpManager();
  final utilService = UtilService();

  Future<User?> getCurrentUser({required String objectId}) async {
    final result = await _httpManager.restRequest(
      url: '${Endpoints.getUser}/$objectId',
      method: HttpMethod.get,
    );
    print(result);
    if (result['error'] != true) {
      return User.fromMap(result);
    } else {
      return null;
    }
  }
}
