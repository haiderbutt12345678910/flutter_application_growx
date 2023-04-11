import 'package:flutter_application_growx/Features/domain/entities/UserEntities/vedioRequestEntity.dart';

import '../../../data/remotedata/firebase_repocontart.dart';

class WritevVedioRequestUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  WritevVedioRequestUseCase({required this.firebaseRepocontart});

  Future<String> writeVedioRequesr(
      VedioRequestEntity vedioRequestEntity, String agentId) async {
    return await firebaseRepocontart.writeVedioRequest(
        vedioRequestEntity, agentId);
  }
}
