import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userplantEntity.dart';

class UserPlantModel extends UserplantEntity {
  UserPlantModel(
      {String? plantationDate,
      String? plantaCategory,
      String? tempOf,
      String? humidity,
      String? co2ppm,
      String? waterVolumne,
      String? imgUrl,
      String? waterTemp,
      String? waterPh,
      String? week})
      : super(
            waterVolumne: waterVolumne,
            plantaCategory: plantaCategory,
            plantationDate: plantationDate,
            tempOf: tempOf,
            humidity: humidity,
            co2ppm: co2ppm,
            waterPh: waterPh,
            waterTemp: waterTemp,
            imgUrl: imgUrl,
            week: week);

  factory UserPlantModel.fromJson(Map<String, dynamic> map) {
    return UserPlantModel(
        plantaCategory: map['plantaCategory'],
        plantationDate: map['plantationDate'],
        waterPh: map['waterPh'],
        waterTemp: map['waterTemp'],
        waterVolumne: map['waterVolumne'],
        imgUrl: map['imgUrl'],
        week: map['week'],
        tempOf: map['tempOf'],
        humidity: map['humidity'],
        co2ppm: map['co2ppm']);
  }

  Map<String, dynamic> toJson() {
    return {
      'plantaCategory': plantaCategory,
      'plantationDate': plantationDate,
      'tempOf': tempOf,
      'humidity': humidity,
      'co2ppm': co2ppm,
      'waterVolumne': waterVolumne,
      'waterTemp': waterTemp,
      'waterPh': waterPh,
      'imgUrl': imgUrl,
      'week': week
    };
  }
}
