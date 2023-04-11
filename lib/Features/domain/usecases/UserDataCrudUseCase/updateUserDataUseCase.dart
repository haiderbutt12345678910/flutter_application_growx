import 'dart:io';
import 'dart:typed_data';

import '../../../data/remotedata/firebase_repocontart.dart';
import '../../entities/UserEntities/userdataentity.dart';

class UpdateUserDataUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  UpdateUserDataUseCase({required this.firebaseRepocontart});

  Future<String> updateUser(
      Userdataentity userdataentity, File? image, Uint8List? uint8list) async {
    return await firebaseRepocontart.updateUser(
        userdataentity, image, uint8list);
  }
}
