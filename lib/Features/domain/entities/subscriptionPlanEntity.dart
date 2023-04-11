class SubscriptionPlanEntity {
  String? discountedAmount;
  String? title;
  String? baseAmount;
  String? trialAmount;
  String? name;
  String? trialPeriod;
  String? uid;
  String? id;
  String? payPalId;
  String? subscriptionPeriod;
  List<dynamic>? optionList;
  SubscriptionPlanEntity(
      {this.discountedAmount,
      this.payPalId,
      this.id,
      this.subscriptionPeriod,
      this.optionList,
      this.baseAmount,
      this.name,
      this.uid,
      this.trialAmount,
      this.trialPeriod,
      this.title});
}
