import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';

import '../../../data/remotedata/firebase_repocontart.dart';

class ReadUserDataUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  ReadUserDataUseCase({required this.firebaseRepocontart});

  Future<Userdataentity> readUser() async {
    return await firebaseRepocontart.readUser();
  }
}
