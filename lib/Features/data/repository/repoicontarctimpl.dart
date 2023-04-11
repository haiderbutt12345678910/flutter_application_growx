import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_application_growx/Features/data/remotedata/firebase_repocontart.dart';
import 'package:flutter_application_growx/Features/domain/entities/AgentEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/vedioRequestEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/agentEmailEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/chatEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/chatOverViewEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/payPalEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/subscriptionPlanEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';
import 'package:flutter_application_growx/Features/domain/entities/vediosEntity.dart';
import 'package:flutter_application_growx/Features/domain/repository/repocontract.dart';

class Repoicontarctimpl implements RepoContract {
  FirebaseRepocontart firebaseRepositoryImpl;
  Repoicontarctimpl({required this.firebaseRepositoryImpl});
  @override
  Future<bool> isLoggedIn() async {
    return await firebaseRepositoryImpl.isLoggedIn();
  }

  @override
  Future<String> logIn(String email, String password) async {
    return await firebaseRepositoryImpl.logIn(email, password);
  }

  @override
  Future<String> logOut() async {
    return await firebaseRepositoryImpl.logOut();
  }

  @override
  Future<String> signUp(
      String email,
      String password,
      String agentId,
      String userCount,
      Userdataentity userdataentity,
      File? image,
      Uint8List? uint8list) async {
    return await firebaseRepositoryImpl.signUp(
        email, password, agentId, userCount, userdataentity, image, uint8list);
  }

  @override
  Future<List<SubscriptionPlanEntity>> readPlans() async {
    return await firebaseRepositoryImpl.readPlans();
  }

  @override
  Future<String> createUser(Userdataentity userdataentity) async {
    return await firebaseRepositoryImpl.createUser(userdataentity);
  }

  @override
  Future<UserEmailEntity?> readEmails(String agentId) async {
    return await firebaseRepositoryImpl.readEmails(agentId);
  }

  @override
  Future<Userdataentity> readUser() async {
    return await firebaseRepositoryImpl.readUser();
  }

  @override
  Future<String> updateUser(
      Userdataentity userdataentity, File? image, Uint8List? uint8list) async {
    return await firebaseRepositoryImpl.updateUser(
        userdataentity, image, uint8list);
  }

  @override
  Future<String> writeEmails(
      UserEmailEntity emailEntity, String agentId) async {
    return await firebaseRepositoryImpl.writeEmails(emailEntity, agentId);
  }

  @override
  Future<List<AgentEntity>> readAgentList() async {
    return await firebaseRepositoryImpl.readAgentList();
  }

  @override
  Stream<List<ChatEntity>> readChatList(String agentId) {
    return firebaseRepositoryImpl.readChatList(agentId);
  }

  @override
  Future<String> writeChatMassege(ChatEntity chatEntity, String agentId) async {
    return await firebaseRepositoryImpl.writeChatMassege(chatEntity, agentId);
  }

  @override
  Future<String> requestLiveChat(
      String agentId, ChatOverViewEntity chatOverViewEntity) async {
    return await firebaseRepositoryImpl.requestLiveChat(
        agentId, chatOverViewEntity);
  }

  @override
  Future<VedioRequestEntity> readVedioRequest(String agentId) async {
    return await firebaseRepositoryImpl.readVedioRequest(
      agentId,
    );
  }

  @override
  Future<String> writeVedioRequest(
      VedioRequestEntity vedioRequestEntity, String agentId) async {
    return await firebaseRepositoryImpl.writeVedioRequest(
        vedioRequestEntity, agentId);
  }

  @override
  Future<List<VediosEntity>> readVedioList() async {
    return await firebaseRepositoryImpl.readVedioList();
  }

  @override
  Future<String> updateSubscrition(PayPalEntity palEntity,
      SubscriptionPlanEntity subscriptionPlanEntity) async {
    return await firebaseRepositoryImpl.updateSubscrition(
        palEntity, subscriptionPlanEntity);
  }

  @override
  Future<String> updateSubscriptionPlan(
      PayPalEntity payPalEntity,
      SubscriptionPlanEntity subscriptionPlanEntity,
      String payPalUserId) async {
    return await firebaseRepositoryImpl.updateSubscriptionPlan(
        payPalEntity, subscriptionPlanEntity, payPalUserId);
  }
}
