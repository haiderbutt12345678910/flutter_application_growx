import 'package:flutter_application_growx/Features/domain/entities/vediosEntity.dart';

class VedioModel extends VediosEntity {
  VedioModel({
    List<dynamic>? vedioids,
    int? week,
    List<dynamic>? vedioTitle,
    List<dynamic>? vediodes,
  }) : super(
            vedioTitle: vedioTitle,
            vedioids: vedioids,
            vediodes: vediodes,
            week: week);

  factory VedioModel.fromJson(Map<String, dynamic> map) {
    return VedioModel(
        week: map["week"],
        vedioTitle: map["vedioTitle"],
        vediodes: map["vediodes"],
        vedioids: map["vedioids"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "week": week,
      "vedioTitle": vedioTitle,
      "vediodes": vediodes,
      "vedioids": vedioids,
    };
  }
}
