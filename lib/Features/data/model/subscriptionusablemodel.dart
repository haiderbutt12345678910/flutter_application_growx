import '../../domain/entities/subscriptionusableentity.dart';

class Subscriptionusablemodel extends Subscriptionusableentity {
  Subscriptionusablemodel({required bool isAvaialible, required String option})
      : super(isAvaialible: isAvaialible, option: option);

  factory Subscriptionusablemodel.fromJson(Map<String, dynamic> map) {
    return Subscriptionusablemodel(
        isAvaialible: map["isAvaialible"], option: map["option"]);
  }

  Map<String, dynamic> toJson() {
    return {"isAvaialible": isAvaialible, "option": option};
  }
}
