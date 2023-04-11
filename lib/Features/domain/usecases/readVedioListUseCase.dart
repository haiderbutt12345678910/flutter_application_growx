import 'package:flutter_application_growx/Features/domain/entities/vediosEntity.dart';

import '../../data/remotedata/firebase_repocontart.dart';

class ReadVedioListUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  ReadVedioListUseCase({required this.firebaseRepocontart});

  Future<List<VediosEntity>> readVedioList() async {
    return await firebaseRepocontart.readVedioList();
  }
}
