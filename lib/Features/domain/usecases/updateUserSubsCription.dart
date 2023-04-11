import 'package:flutter_application_growx/Features/domain/entities/UserEntities/vedioRequestEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/payPalEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/subscriptionPlanEntity.dart';

import '../../data/remotedata/firebase_repocontart.dart';

class UpdateSubsCriptionUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  UpdateSubsCriptionUseCase({required this.firebaseRepocontart});

  Future<String> updateSubsCription(PayPalEntity payPalEntity,
      SubscriptionPlanEntity subscriptionPlanEntity) async {
    return await firebaseRepocontart.updateSubscrition(
        payPalEntity, subscriptionPlanEntity);
  }
}
