import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userSubscripsCritionEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userplantEntity.dart';

class Userdataentity {
  String? uid;
  String? imageUrl;
  String? agentId;
  String? name;
  String? adress;
  String? phoneNumber;

  UserplantEntity? userplantEntity;
  UserSubscripsCritionEntity? userSubscripsCritionEntity;

  Userdataentity(
      {this.uid,
      this.adress,
      this.phoneNumber,
      this.imageUrl,
      this.agentId,
      this.userplantEntity,
      this.name,
      this.userSubscripsCritionEntity});
}
