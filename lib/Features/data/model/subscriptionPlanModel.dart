import 'package:flutter_application_growx/Features/data/model/subscriptionusablemodel.dart';
import 'package:flutter_application_growx/Features/domain/entities/subscriptionPlanEntity.dart';

class SubscriptionPlanModel extends SubscriptionPlanEntity {
  SubscriptionPlanModel(
      {String? discountedAmount,
      String? subscriptionPeriod,
      String? baseAmount,
      String? title,
      String? trialAmount,
      String? name,
      String? trialPeriod,
      String? uid,
      String? payPalId,
      String? id,
      List<dynamic>? optionList})
      : super(
            payPalId: payPalId,
            id: id,
            subscriptionPeriod: subscriptionPeriod,
            title: title,
            optionList: optionList,
            discountedAmount: discountedAmount,
            baseAmount: baseAmount,
            trialAmount: trialAmount,
            name: name,
            trialPeriod: trialPeriod,
            uid: uid);

  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> map) {
    var fectchedList = map["optionList"] as List<dynamic>;

    var convetedList = fectchedList.map(
      (e) {
        return Subscriptionusablemodel.fromJson(e);
      },
    ).toList();

    return SubscriptionPlanModel(
        payPalId: map['payPalId'],
        id: map['id'],
        subscriptionPeriod: map["subscriptionPeriod"],
        title: map["title"],
        discountedAmount: map["discountedAmount"],
        baseAmount: map["baseAmount"],
        trialAmount: map["trialAmount"],
        name: map["name"],
        trialPeriod: map["trialPeriod"],
        uid: map["uid"],
        optionList: convetedList);
  }

  Map<String, dynamic> toJson() {
    final consvertdelist = optionList!.map((e) {
      return Subscriptionusablemodel(
              isAvaialible: e.isAvaialible, option: e.option)
          .toJson();
    });

    return {
      'payPalId': payPalId,
      'id': id,
      "subscriptionPeriod": subscriptionPeriod,
      "title": title,
      "discountedAmount": discountedAmount,
      "baseAmount": baseAmount,
      "trialAmount": trialAmount,
      "name": name,
      "trialPeriod": trialPeriod,
      "uid": uid,
      "optionList": consvertdelist
    };
  }
}
