import 'package:flutter_application_growx/Features/domain/entities/UserEntities/vedioRequestEntity.dart';

import '../../../data/remotedata/firebase_repocontart.dart';

class ReadVedioRequestUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  ReadVedioRequestUseCase({required this.firebaseRepocontart});

  Future<VedioRequestEntity> readVedioRequesr(String agentId) async {
    return await firebaseRepocontart.readVedioRequest(agentId);
  }
}
