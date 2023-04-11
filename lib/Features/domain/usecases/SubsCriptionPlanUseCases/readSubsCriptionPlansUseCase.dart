import 'package:flutter_application_growx/Features/domain/entities/subscriptionPlanEntity.dart';

import '../../../data/remotedata/firebase_repocontart.dart';

class ReadSubsCriptionPlansUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  ReadSubsCriptionPlansUseCase({required this.firebaseRepocontart});

  Future<List<SubscriptionPlanEntity>> readPlans() {
    return firebaseRepocontart.readPlans();
  }
}
