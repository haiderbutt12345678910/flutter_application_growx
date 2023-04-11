import 'package:flutter_application_growx/Features/domain/entities/agentEmailEntity.dart';

import '../../../data/remotedata/firebase_repocontart.dart';

class ReadEmailUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  ReadEmailUseCase({required this.firebaseRepocontart});

  Future<UserEmailEntity?> readEmails(String agentId) async {
    return await firebaseRepocontart.readEmails(agentId);
  }
}
