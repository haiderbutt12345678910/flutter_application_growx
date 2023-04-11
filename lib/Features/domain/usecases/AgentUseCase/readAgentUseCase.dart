import 'package:flutter_application_growx/Features/domain/entities/AgentEntity.dart';

import '../../../data/remotedata/firebase_repocontart.dart';

class ReadAgentUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  ReadAgentUseCase({required this.firebaseRepocontart});
  Future<List<AgentEntity>> readAgentList() async {
    return await firebaseRepocontart.readAgentList();
  }
}
