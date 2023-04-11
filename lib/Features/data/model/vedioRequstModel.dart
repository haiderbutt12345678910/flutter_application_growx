import '../../domain/entities/UserEntities/vedioRequestEntity.dart';

class VedioRequstModel extends VedioRequestEntity {
  VedioRequstModel({
    String? dateTime,
    String? meetingpasscode,
    String? updatedAt,
    String? uid,
  }) : super(
            dateTime: dateTime,
            meetingpasscode: meetingpasscode,
            updatedAt: updatedAt,
            uid: uid);

  factory VedioRequstModel.fromJson(Map<String, dynamic> map) {
    return VedioRequstModel(
        dateTime: map["dateTime"],
        meetingpasscode: map["meetingpasscode"],
        updatedAt: map["updatedAt"],
        uid: map["uid"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "dateTime": dateTime,
      "meetingpasscode": meetingpasscode,
      "updatedAt": updatedAt,
      "uid": uid
    };
  }
}
