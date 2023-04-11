import 'package:flutter_application_growx/Features/domain/entities/AgentEntity.dart';

class AgentModel extends AgentEntity {
  AgentModel({
    String? id,
    String? name,
    String? userCount,
  }) : super(id: id, name: name, userCount: userCount);

  factory AgentModel.fromJson(Map<String, dynamic> map) {
    return AgentModel(
        id: map["id"], name: map["name"], userCount: map["userCount"]);
  }
}
