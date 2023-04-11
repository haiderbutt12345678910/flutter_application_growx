import 'package:flutter_application_growx/Features/domain/entities/chatEntity.dart';

import '../../../data/remotedata/firebase_repocontart.dart';

class WriteChatUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  WriteChatUseCase({required this.firebaseRepocontart});

  Future<String> writeChatMassege(ChatEntity chatEntity, String agentId) async {
    return await firebaseRepocontart.writeChatMassege(chatEntity, agentId);
  }
}
