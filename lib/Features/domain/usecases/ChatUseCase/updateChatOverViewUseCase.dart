import '../../../data/remotedata/firebase_repocontart.dart';
import '../../entities/chatOverViewEntity.dart';

class UpdateChatOverViewUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  UpdateChatOverViewUseCase({required this.firebaseRepocontart});

  Future<String> requestLiveChat(
      String agentId, ChatOverViewEntity chatOverViewEntity) async {
    return await firebaseRepocontart.requestLiveChat(
        agentId, chatOverViewEntity);
  }
}
