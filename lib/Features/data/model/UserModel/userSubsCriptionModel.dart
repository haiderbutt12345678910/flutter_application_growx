import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userSubscripsCritionEntity.dart';

class UserSubsCriptionModel extends UserSubscripsCritionEntity {
  UserSubsCriptionModel({
    String? payPalSubId,
    String? payPalUserId,
    String? id,
  }) : super(payPalSubId: payPalSubId, id: id, payPalUserId: payPalUserId);

  factory UserSubsCriptionModel.fromJson(Map<String, dynamic> map) {
    return UserSubsCriptionModel(
        id: map['id'],
        payPalSubId: map['payPalSubId'],
        payPalUserId: map['payPalUserId']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'payPalSubId': payPalSubId,
      'payPalUserId': payPalUserId,
    };
  }
}
