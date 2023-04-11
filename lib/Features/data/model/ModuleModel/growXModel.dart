import 'package:flutter_application_growx/Features/domain/entities/Modules/growX.dart';

class GrowXModel extends GrowXEntity {
  GrowXModel(
      {String? plantationDate,
      String? plantaCategory,
      String? temprature,
      String? waterLeveL,
      String? phLevel,
      String? imgUrl,
      String? day,
      String? week})
      : super(
          plantaCategory: plantaCategory,
          plantationDate: plantationDate,
          temprature: temprature,
          waterLeveL: waterLeveL,
          phLevel: phLevel,
          imgUrl: imgUrl,
        );

  factory GrowXModel.fromJson(Map<String, dynamic> map) {
    return GrowXModel(
        plantaCategory: map['plantaCategory'],
        plantationDate: map['plantationDate'],
        phLevel: map['phLevel'],
        waterLeveL: map['waterLeveL'],
        temprature: map['temprature'],
        imgUrl: map['imgUrl'],
        week: map['week']);
  }

  Map<String, dynamic> toJson() {
    return {
      'plantaCategory': plantaCategory,
      'plantationDate': plantationDate,
      'phLevel': phLevel,
      'waterLeveL': waterLeveL,
      'temprature': temprature,
      'imgUrl': imgUrl,
    };
  }
}
