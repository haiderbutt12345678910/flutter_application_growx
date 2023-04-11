import '../../data/remotedata/firebase_repocontart.dart';
import '../entities/payPalEntity.dart';
import '../entities/subscriptionPlanEntity.dart';

class UpdatesubscriptionPlanPayPalUsecase {
  final FirebaseRepocontart firebaseRepocontart;
  UpdatesubscriptionPlanPayPalUsecase({required this.firebaseRepocontart});

  Future<String> updateSubscriptionPlan(
      PayPalEntity payPalEntity,
      SubscriptionPlanEntity subscriptionPlanEntity,
      String payPalUserId) async {
    return await firebaseRepocontart.updateSubscriptionPlan(
        payPalEntity, subscriptionPlanEntity, payPalUserId);
  }
}
