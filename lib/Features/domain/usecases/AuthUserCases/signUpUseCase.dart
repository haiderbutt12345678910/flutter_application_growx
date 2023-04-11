import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_application_growx/Features/data/remotedata/firebase_repocontart.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';

class SignUpUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  SignUpUseCase({required this.firebaseRepocontart});

  Future<String> signup(
      String email,
      String password,
      String agentId,
      String userCount,
      Userdataentity userdataentity,
      File? image,
      Uint8List? uint8list) async {
    return await firebaseRepocontart.signUp(
        email, password, agentId, userCount, userdataentity, image, uint8list);
  }
}
