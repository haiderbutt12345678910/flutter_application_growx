import 'package:flutter_application_growx/Features/domain/entities/chatEntity.dart';

class ChatModel extends ChatEntity {
  ChatModel({
    String? senderId,
    String? massege,
    String? createdAt,
  }) : super(
          createdAt: createdAt,
          senderId: senderId,
          massege: massege,
        );

  factory ChatModel.fromJson(Map<String, dynamic> map) {
    return ChatModel(
      senderId: map["senderId"],
      massege: map["massege"],
      createdAt: map["createdAt"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "senderId": senderId,
      "massege": massege,
      "createdAt": createdAt,
    };
  }
}
