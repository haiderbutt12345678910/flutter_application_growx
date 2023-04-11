import 'package:flutter_application_growx/Features/domain/entities/agentEmailEntity.dart';

class UserEmailModl extends UserEmailEntity {
  UserEmailModl({
    String? userName,
    String? imgUrl,
    String? email,
    String? createdAt,
    String? reply,
  }) : super(
            imgUrl: imgUrl,
            email: email,
            createdAt: createdAt,
            reply: reply,
            userName: userName);
  factory UserEmailModl.fromJson(Map<String, dynamic> map) {
    return UserEmailModl(
        email: map["email"],
        createdAt: map["createdAt"],
        reply: map["reply"],
        userName: map["userName"],
        imgUrl: map["imgUrl"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "createdAt": createdAt,
      "reply": reply,
      "userName": userName,
      "imgUrl": imgUrl
    };
  }
}
