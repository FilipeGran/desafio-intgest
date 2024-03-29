// ignore_for_file: avoid_print

import 'package:desafio_intgest/src/models/user.dart';
import 'package:desafio_intgest/src/pages/profile/profile_repository/profile_repository.dart';
import 'package:desafio_intgest/src/services/util_services.dart';

class ProfileController {
  final utilService = UtilService();
  final profileRepository = ProfileRepository();

  Future<User?> getUser() async {
    final objectId = await utilService.getLocalData(key: 'objectId');
    if (objectId == null || objectId.isEmpty) {
      return null;
    } else {
      final result = await profileRepository.getCurrentUser(
        objectId: objectId,
      );

      if (result != null) {
        return result;
      } else {
        return null;
      }
    }
  }
}
