import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_application_growx/Features/domain/entities/payPalEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/vediosEntity.dart';

import '../../domain/entities/AgentEntity.dart';
import '../../domain/entities/UserEntities/vedioRequestEntity.dart';
import '../../domain/entities/agentEmailEntity.dart';
import '../../domain/entities/chatEntity.dart';
import '../../domain/entities/chatOverViewEntity.dart';
import '../../domain/entities/subscriptionPlanEntity.dart';
import '../../domain/entities/UserEntities/userdataentity.dart';

abstract class FirebaseRepocontart {
  Future<String> logIn(String email, String password);
  Future<String> signUp(
      String email,
      String password,
      String agentId,
      String userCount,
      Userdataentity userdataentity,
      File? image,
      Uint8List? uint8list);
  Future<bool> isLoggedIn();
  Future<String> logOut();
  Future<List<SubscriptionPlanEntity>> readPlans();

  //user crud
  Future<String> createUser(Userdataentity userdataentity);
  Future<Userdataentity> readUser();
  Future<String> updateUser(
      Userdataentity userdataentity, File? image, Uint8List? uint8list);
  //email Crud
  Future<String> writeEmails(UserEmailEntity emailEntity, String agentId);
  Future<UserEmailEntity?> readEmails(String agentId);

  //readAgent
  Future<List<AgentEntity>> readAgentList();

  //readChatCrud
  Future<String> writeChatMassege(ChatEntity chatEntity, String agentId);
  Stream<List<ChatEntity>> readChatList(String agentId);

  //chatOverView
  Future<String> requestLiveChat(
      String agentId, ChatOverViewEntity chatOverViewEntity);

  //VedioRequestCrud
  Future<String> writeVedioRequest(
      VedioRequestEntity vedioRequestEntity, String agentId);
  Future<VedioRequestEntity> readVedioRequest(String agentId);

  //readVedios
  Future<List<VediosEntity>> readVedioList();

  //updatesubscription
  Future<String> updateSubscrition(
      PayPalEntity palEntity, SubscriptionPlanEntity subscriptionPlanEntity);

  Future<String> updateSubscriptionPlan(
    PayPalEntity payPalEntity,
    SubscriptionPlanEntity subscriptionPlanEntity,
    String payPalUserId,
  );
}
