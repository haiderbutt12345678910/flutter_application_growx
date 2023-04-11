import 'package:flutter_application_growx/Features/domain/entities/chatOverViewEntity.dart';

class ChatOverViewModel extends ChatOverViewEntity {
  ChatOverViewModel({
    String? uid,
    String? userName,
    String? createdAt,
    String? imgUrl,
  }) : super(
            imgUrl: imgUrl, userName: userName, uid: uid, createdAt: createdAt);

  factory ChatOverViewModel.fromJson(Map<String, dynamic> map) {
    return ChatOverViewModel(
        uid: map["uid"],
        userName: map["userName"],
        imgUrl: map["imgUrl"],
        createdAt: map["createdAt"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "userName": userName,
      "imgUrl": imgUrl,
      "createdAt": createdAt
    };
  }
}
