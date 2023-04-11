import 'package:flutter_application_growx/Features/data/model/UserModel/userPlantModel.dart';
import 'package:flutter_application_growx/Features/data/model/UserModel/userSubsCriptionModel.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userSubscripsCritionEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userplantEntity.dart';

class UserDataModel extends Userdataentity {
  UserDataModel({
    String? uid,
    String? imageUrl,
    String? agentId,
    String? name,
    String? adress,
    String? phoneNumber,
    UserplantEntity? userplantEntity,
    UserSubscripsCritionEntity? userSubscripsCritionEntity,
  }) : super(
            name: name,
            adress: adress,
            imageUrl: imageUrl,
            uid: uid,
            phoneNumber: phoneNumber,
            agentId: agentId,
            userplantEntity: userplantEntity,
            userSubscripsCritionEntity: userSubscripsCritionEntity);

  factory UserDataModel.fromJson(Map<String, dynamic> map) {
    UserPlantModel plantModel = UserPlantModel.fromJson(map['userplantEntity']);
    UserSubsCriptionModel subscriptionModel =
        UserSubsCriptionModel.fromJson(map['userSubscripsCritionEntity']);

    return UserDataModel(
        name: map['name'],
        adress: map['adress'],
        phoneNumber: map['phoneNumber'],
        uid: map['uid'],
        imageUrl: map['imageUrl'],
        agentId: map['agentId'],
        userplantEntity: plantModel,
        userSubscripsCritionEntity: subscriptionModel);
  }

  Map<String, dynamic> toJson() {
    var plantModel = UserPlantModel(
      plantationDate: userplantEntity!.plantationDate,
      plantaCategory: userplantEntity!.plantaCategory,
    ).toJson();

    var userSubsCriptionModel = UserSubsCriptionModel(
            payPalSubId: userSubscripsCritionEntity!.payPalSubId,
            payPalUserId: userSubscripsCritionEntity!.payPalUserId,
            id: userSubscripsCritionEntity!.id)
        .toJson();

    return {
      'name': name,
      'adress': adress,
      'phoneNumber': phoneNumber,
      'uid': uid,
      'imageUrl': imageUrl,
      'agentId': agentId,
      'userplantEntity': plantModel,
      'userSubscripsCritionEntity': userSubsCriptionModel
    };
  }
}
