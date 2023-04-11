import 'package:flutter_application_growx/Features/domain/entities/chatEntity.dart';

import '../../../data/remotedata/firebase_repocontart.dart';

class ReadChatUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  ReadChatUseCase({required this.firebaseRepocontart});

  Stream<List<ChatEntity>> readChatList(String agentId) {
    return firebaseRepocontart.readChatList(agentId);
  }
}
