import 'package:flutter_application_growx/Features/domain/entities/agentEmailEntity.dart';

import '../../../data/remotedata/firebase_repocontart.dart';

class WriteEmailUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  WriteEmailUseCase({required this.firebaseRepocontart});

  Future<String> readEmails(UserEmailEntity emailEntity, String agentId) {
    return firebaseRepocontart.writeEmails(emailEntity, agentId);
  }
}
