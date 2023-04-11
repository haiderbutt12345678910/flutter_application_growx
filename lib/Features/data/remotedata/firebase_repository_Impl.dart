import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_growx/Features/data/model/UserModel/userSubsCriptionModel.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_growx/Features/data/model/UserModel/userPlantModel.dart';
import 'package:flutter_application_growx/Features/data/model/agentModel.dart';
import 'package:flutter_application_growx/Features/data/model/chatModel.dart';
import 'package:flutter_application_growx/Features/data/model/chatOverViewModel.dart';
import 'package:flutter_application_growx/Features/data/model/subscriptionPlanModel.dart';
import 'package:flutter_application_growx/Features/data/model/UserModel/userDataModel.dart';
import 'package:flutter_application_growx/Features/data/model/userEmailModl.dart';
import 'package:flutter_application_growx/Features/data/model/vedioModel.dart';
import 'package:flutter_application_growx/Features/data/model/vedioRequstModel.dart';
import 'package:flutter_application_growx/Features/data/remotedata/firebase_repocontart.dart';
import 'package:flutter_application_growx/Features/domain/entities/AgentEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/vedioRequestEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/agentEmailEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/chatEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/chatOverViewEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/subscriptionPlanEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';
import 'package:flutter_application_growx/Features/domain/entities/vediosEntity.dart';
import 'package:intl/intl.dart';
import 'package:paypal_sdk/core.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../const.dart';
import '../../domain/entities/UserEntities/userSubscripsCritionEntity.dart';
import '../../domain/entities/UserEntities/userplantEntity.dart';
import '../../domain/entities/payPalEntity.dart';

class FirebaseRepositoryImpl implements FirebaseRepocontart {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseMessaging firebaseMessaging;
  final FirebaseStorage firebaseStorage;

  FirebaseRepositoryImpl(
      {required this.firebaseAuth,
      required this.firebaseFirestore,
      required this.firebaseMessaging,
      required this.firebaseStorage});

  @override
  Future<bool> isLoggedIn() async {
    if (firebaseAuth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<String> logIn(String email, String password) async {
    String state = "non";

    try {
      await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        state = "S";
      });

      return state;
    } catch (e) {
      state = "F";
      return state;
    }
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
    String state = "non";

    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        var ref = firebaseStorage
            .ref()
            .child("profilepic.jpg")
            .child("${firebaseAuth.currentUser!.uid}.jpg");
        if (kIsWeb) {
          await ref.putData(uint8list as Uint8List).then((p0) async {
            await ref.getDownloadURL().then((value) async {
              var map = UserDataModel(
                      userplantEntity: UserplantEntity(),
                      userSubscripsCritionEntity: UserSubscripsCritionEntity(),
                      uid: firebaseAuth.currentUser!.uid,
                      name: userdataentity.name,
                      adress: userdataentity.adress,
                      phoneNumber: userdataentity.phoneNumber,
                      imageUrl: value,
                      agentId: agentId)
                  .toJson();
              await firebaseFirestore
                  .collection("Users")
                  .doc(firebaseAuth.currentUser!.uid)
                  .set(map)
                  .then((value) async {
                await firebaseFirestore
                    .collection("Agents")
                    .doc(agentId)
                    .update({"userCount": userCount}).then((value) async {
                  state = "S";
                });
              });
            });
          });
        } else {
          await ref.putFile(image as File).then((imgUrl) async {
            await ref.getDownloadURL().then((value) async {
              var map = UserDataModel(
                      userplantEntity: UserplantEntity(),
                      userSubscripsCritionEntity: UserSubscripsCritionEntity(),
                      uid: firebaseAuth.currentUser!.uid,
                      name: userdataentity.name,
                      adress: userdataentity.adress,
                      phoneNumber: userdataentity.phoneNumber,
                      imageUrl: value,
                      agentId: agentId)
                  .toJson();
              await firebaseFirestore
                  .collection("Users")
                  .doc(firebaseAuth.currentUser!.uid)
                  .set(map)
                  .then((value) async {
                await firebaseFirestore
                    .collection("Agents")
                    .doc(agentId)
                    .update({"userCount": userCount}).then((value) async {
                  state = "S";
                });
              });
            });
          });
        }
      });

      return state;
    } on Exception catch (e) {
      state = "F";
      return state;
    }
  }

  @override
  Future<String> logOut() async {
    String state = "non";

    try {
      await firebaseAuth.signOut().then((value) {
        state = "S";
      });

      return state;
    } catch (e) {
      state = "F";
      return state;
    }
  }

  @override
  Future<List<SubscriptionPlanEntity>> readPlans() async {
    List<SubscriptionPlanEntity> state = [];
    try {
      await firebaseFirestore
          .collection("SubsCriptionPlans")
          .orderBy('baseAmount', descending: false)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          List<SubscriptionPlanEntity> newlist = [];
          for (var element in value.docs) {
            var a = element.data();
            final subscriptionPlanModel = SubscriptionPlanModel.fromJson(a);
            newlist.add(subscriptionPlanModel);
          }

          state = newlist;
        }
      });

      return state;
    } on Exception catch (e) {
      return state;
    }
  }

  @override
  Future<String> createUser(Userdataentity userdataentity) async {
    String state = "non";
    try {
      // var map = UserDataModel(
      //         uid: firebaseAuth.currentUser!.uid,
      //         plantationDate: userdataentity.plantationDate,
      //         palntCategory: userdataentity.palntCategory,
      //         subscriptionEndDate: userdataentity.subcriptionStartingDate,
      //         subcriptionStartingDate: userdataentity.subscriptionEndDate,
      //         subcriptionId: userdataentity.subcriptionId,
      //         imageUrl: userdataentity.imageUrl,
      //         agentId: userdataentity.agentId)
      //     .toJson();
      // await firebaseFirestore
      //     .collection("Users")
      //     .doc(firebaseAuth.currentUser!.uid)
      //     .set(map)
      //     .then((value) {
      //   state = "S";
      // });

      return state;
    } on Exception catch (e) {
      state = "F";
      return state;
    }
  }

  @override
  Future<Userdataentity> readUser() async {
    Userdataentity userdataentity = Userdataentity();

    try {
      await firebaseFirestore
          .collection("Users")
          .doc(firebaseAuth.currentUser!.uid)
          .get()
          .then((value) {
        if (value.exists) {
          var map = value.data();
          var fromJson = UserDataModel.fromJson(map as Map<String, dynamic>);
          Userdataentity dataEntity = Userdataentity(
              uid: fromJson.uid,
              userSubscripsCritionEntity: fromJson.userSubscripsCritionEntity,
              userplantEntity: fromJson.userplantEntity,
              imageUrl: fromJson.imageUrl,
              agentId: fromJson.agentId);
          userdataentity = dataEntity;
        }
      });

      return userdataentity;
    } on Exception catch (e) {
      return userdataentity;
    }
  }

  @override
  Future<String> updateUser(
      Userdataentity userdataentity, File? image, Uint8List? uint8list) async {
    String state = "non";
    try {
      if (userdataentity.userplantEntity != null) {
        if (kIsWeb) {
          var ref = firebaseStorage
              .ref()
              .child("plantpic.jpg")
              .child("${firebaseAuth.currentUser!.uid}.jpg");

          await ref.putData(uint8list as Uint8List).then((p0) async {
            await ref.getDownloadURL().then((imgurl) async {
              var model = UserPlantModel(
                      plantaCategory:
                          userdataentity.userplantEntity!.plantationDate,
                      plantationDate:
                          userdataentity.userplantEntity!.plantationDate,
                      tempOf: userdataentity.userplantEntity!.tempOf,
                      waterPh: userdataentity.userplantEntity!.waterPh,
                      waterTemp: userdataentity.userplantEntity!.waterTemp,
                      imgUrl: imgurl,
                      waterVolumne:
                          userdataentity.userplantEntity!.waterVolumne,
                      co2ppm: userdataentity.userplantEntity!.waterVolumne)
                  .toJson();

              await firebaseFirestore
                  .collection("Users")
                  .doc(firebaseAuth.currentUser!.uid)
                  .update({"userplantEntity": model}).then((value) {
                state = "S";
              });
            });
          });
        } else {
          var ref = firebaseStorage
              .ref()
              .child("plantpic.jpg")
              .child("${firebaseAuth.currentUser!.uid}.jpg");

          await ref.putFile(image as File).then((p0) async {
            await ref.getDownloadURL().then((imgurl) async {
              var model = UserPlantModel(
                      plantaCategory:
                          userdataentity.userplantEntity!.plantationDate,
                      plantationDate:
                          userdataentity.userplantEntity!.plantationDate,
                      tempOf: userdataentity.userplantEntity!.tempOf,
                      waterPh: userdataentity.userplantEntity!.waterPh,
                      waterTemp: userdataentity.userplantEntity!.waterTemp,
                      imgUrl: imgurl,
                      waterVolumne:
                          userdataentity.userplantEntity!.waterVolumne,
                      co2ppm: userdataentity.userplantEntity!.waterVolumne)
                  .toJson();

              await firebaseFirestore
                  .collection("Users")
                  .doc(firebaseAuth.currentUser!.uid)
                  .update({"userplantEntity": model}).then((value) {
                state = "S";
              });
            });
          });
        }
      } else if (userdataentity.userSubscripsCritionEntity != null) {
        await firebaseFirestore
            .collection("Users")
            .doc(firebaseAuth.currentUser!.uid)
            .update({
          "userSubscripsCritionEntity":
              userdataentity.userSubscripsCritionEntity
        }).then((value) {
          state = "S";
        });
      } else {
        var ref = firebaseStorage
            .ref()
            .child("profilepic.jpg")
            .child("${firebaseAuth.currentUser!.uid}.jpg");

        if (kIsWeb) {
          await ref.putData(await image!.readAsBytes()).then((p0) async {
            await ref.getDownloadURL().then((imgurl) async {
              await firebaseFirestore
                  .collection("Users")
                  .doc(firebaseAuth.currentUser!.uid)
                  .update({
                "imageUrl": imgurl,
                "name": userdataentity.name
              }).then((value) {
                state = "S";
              });
            });
          });
        } else {
          await ref.putFile(image as File).then((p0) async {
            await ref.getDownloadURL().then((imgurl) async {
              await firebaseFirestore
                  .collection("Users")
                  .doc(firebaseAuth.currentUser!.uid)
                  .update({
                "imageUrl": imgurl,
                "name": userdataentity.name
              }).then((value) {
                state = "S";
              });
            });
          });
        }
      }

      return state;
    } on Exception catch (e) {
      state = "F";
      return state;
    }
  }

  @override
  Future<UserEmailEntity?> readEmails(String agentId) async {
    UserEmailEntity? state;

    try {
      await firebaseFirestore
          .collection("Agents")
          .doc(agentId)
          .collection("Email")
          .doc(firebaseAuth.currentUser!.uid)
          .get()
          .then((value) {
        if (value.exists) {
          var a = value.data() as Map<String, dynamic>;
          final emailModel = UserEmailModl.fromJson(a);

          state = emailModel;
        } else {
          state = UserEmailEntity(email: "Exampleemailfromuser");
        }
      });

      return state;
    } on Exception catch (e) {
      return state;
    }
  }

  @override
  Future<String> writeEmails(
      UserEmailEntity emailEntity, String agentId) async {
    String state = "non";
    try {
      var map = UserEmailModl(
        imgUrl: emailEntity.imgUrl,
        createdAt: emailEntity.createdAt,
        reply: emailEntity.reply,
        userName: emailEntity.userName,
        email: emailEntity.email,
      ).toJson();
      await firebaseFirestore
          .collection("Agents")
          .doc(agentId)
          .collection("Email")
          .doc(firebaseAuth.currentUser!.uid)
          .set(map)
          .then((value) {
        state = "S";
      });
      return state;
    } on Exception catch (e) {
      state = "F";
      return state;
    }
  }

  @override
  Future<List<AgentEntity>> readAgentList() async {
    List<AgentEntity> agnetList = [];

    try {
      await firebaseFirestore
          .collection("Agents")
          .orderBy("userCount", descending: true)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          List<AgentEntity> newlist = [];
          for (var element in value.docs) {
            var a = element.data();
            final agentModel = AgentModel.fromJson(a);
            newlist.add(agentModel);
          }

          agnetList = newlist;
        }
      });

      return agnetList;
    } on Exception catch (e) {
      return agnetList;
    }
  }

  @override
  Stream<List<ChatEntity>> readChatList(String agentId) {
    return firebaseFirestore
        .collection("Agents")
        .doc(agentId)
        .collection("LiveChats")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("UserChat")
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((doc) => ChatModel.fromJson(doc.data()))
            .toList());

    // return firebaseFirestore
    //     .collection("Agents")
    //     .doc(agentId)
    //     .collection("LiveChats")
    //     .doc(firebaseAuth.currentUser!.uid)
    //     .collection("UserChat")
    //     .snapshots()
    //     .map((event) => event.docs.map((e) => ChatModel.fromJson()));
  }

  @override
  Future<String> writeChatMassege(ChatEntity chatEntity, String agentId) async {
    String state = "non";
    try {
      var chatModel = ChatModel(
              senderId: firebaseAuth.currentUser!.uid,
              massege: chatEntity.massege,
              createdAt: chatEntity.createdAt)
          .toJson();
      await firebaseFirestore
          .collection("Agents")
          .doc(agentId)
          .collection("LiveChats")
          .doc(firebaseAuth.currentUser!.uid)
          .collection("UserChat")
          .doc()
          .set(chatModel)
          .then((value) {
        state = "S";
      });

      return state;
    } on Exception catch (e) {
      return state;
    }
  }

  @override
  Future<String> requestLiveChat(
      String agentId, ChatOverViewEntity chatOverViewEntity) async {
    //improvements check forr agnet usercount collection
    String state = "non";
    try {
      DateTime dateTime = DateTime.now();
      String createdAt = dateTime.toUtc().toString();
      var map = ChatOverViewModel(
              uid: firebaseAuth.currentUser!.uid,
              userName: chatOverViewEntity.userName,
              imgUrl: chatOverViewEntity.imgUrl,
              createdAt: createdAt)
          .toJson();
      await firebaseFirestore
          .collection("Agents")
          .doc(agentId)
          .collection("LiveChats")
          .doc(firebaseAuth.currentUser!.uid)
          .set(map)
          .then((value) {
        state = "S";
      });

      return state;
    } on Exception catch (e) {
      state = "F";
      return state;
    }
  }

  @override
  Future<VedioRequestEntity> readVedioRequest(String agentId) async {
    VedioRequestEntity vedioRequestEntity = VedioRequestEntity(dateTime: "non");
    try {
      await firebaseFirestore
          .collection("Agents")
          .doc(agentId)
          .collection("VedioRequests")
          .doc(firebaseAuth.currentUser!.uid)
          .get()
          .then((value) {
        if (value.exists) {
          var map = value.data();
          vedioRequestEntity =
              VedioRequstModel.fromJson(map as Map<String, dynamic>);
        } else {
          vedioRequestEntity = VedioRequestEntity(dateTime: "non");
        }
      });
      return vedioRequestEntity;
    } on Exception catch (e) {
      return vedioRequestEntity;
    }
  }

  @override
  Future<String> writeVedioRequest(
      VedioRequestEntity vedioRequestEntity, String agentId) async {
    String state = "non";
    try {
      DateTime dateTime = DateTime.now();
      String createdAt = dateTime.toUtc().toString();
      var map = VedioRequstModel(
              uid: firebaseAuth.currentUser!.uid,
              dateTime: vedioRequestEntity.dateTime,
              meetingpasscode: vedioRequestEntity.meetingpasscode,
              updatedAt: createdAt)
          .toJson();
      await firebaseFirestore
          .collection("Agents")
          .doc(agentId)
          .collection("VedioRequests")
          .doc(firebaseAuth.currentUser!.uid)
          .set(map)
          .then((value) {
        state = "S";
      });

      return state;
    } on Exception catch (e) {
      state = "F";
      return state;
    }
  }

  @override
  Future<List<VediosEntity>> readVedioList() async {
    List<VediosEntity> list = [];
    try {
      await firebaseFirestore
          .collection("Vedios")
          .orderBy('week', descending: false)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          for (var element in value.docs) {
            var a = element.data();
            var model = VedioModel.fromJson(a);
            list.add(model);
          }
        }
      });

      return list;
    } on Exception catch (e) {
      return list;
    }
  }

  @override
  Future<String> updateSubscrition(PayPalEntity palEntity,
      SubscriptionPlanEntity subscriptionPlanEntity) async {
    String state = "non";
    try {
      DateTime startTime = DateTime.now().add(Duration(seconds: 30));

// Format the DateTime object in ISO 8601 format with a time zone offset
      String formattedStartTime =
          DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(startTime.toUtc());

      final url =
          Uri.https('api.sandbox.paypal.com', '/v1/billing/subscriptions');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$clientid:$secretKey'))}',
        },
        body: json.encode({
          'plan_id': subscriptionPlanEntity.payPalId,
          'start_time': formattedStartTime,
          'subscriber': {
            'name': {'given_name': "Haider", 'surname': "Ali"},
            'email_address': palEntity.emaill,
          },
          'application_context': {
            'brand_name': 'YOUR_BRAND_NAME',
            'locale': 'en-US',
            'shipping_preference': 'NO_SHIPPING',
            'user_action': 'SUBSCRIBE_NOW',
            'payment_method': {
              'payer_selected': 'PAYPAL',
              'payee_preferred': 'IMMEDIATE_PAYMENT_REQUIRED',
              'billing_address': {
                'address_line_1': '123 Main St.',
                'admin_area_2': 'San Jose',
                'admin_area_1': 'CA',
                'postal_code': '95131',
                'country_code': 'US',
              },
            },
          },
          'payment_source': {
            'credit_card': {
              'number': palEntity.cardNumber,
              'expiry': palEntity.expiryMonth + palEntity.expiryYear,
              'cvv': palEntity.cvv,
              'name': "Haider" + ' ' + "Ali",
            },
          },
        }),
      );

      if (response.statusCode == 201) {
        print("sucess");
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String subscriptionId = responseData['id'];
        print(subscriptionId);
        var userSubscripsCritionEntity = UserSubsCriptionModel(
                payPalSubId: subscriptionPlanEntity.payPalId,
                id: subscriptionPlanEntity.id,
                payPalUserId: subscriptionId)
            .toJson();

        try {
          await firebaseFirestore
              .collection("Users")
              .doc(firebaseAuth.currentUser!.uid)
              .update({
            "userSubscripsCritionEntity": userSubscripsCritionEntity
          }).then((value) {
            print(state);
            state = "S";
            print(state);
          });
        } on Exception catch (e) {
          print(e.toString());
        }
      }

      return state;
    } on Exception catch (e) {
      print(state);
      return state;
    }
  }

  @override
  Future<String> updateSubscriptionPlan(
    PayPalEntity payPalEntity,
    SubscriptionPlanEntity subscriptionPlanEntity,
    String payPalUserId,
  ) async {
    print(payPalUserId);

    String state = "F";
    try {
      final url = Uri.https(
          'api.sandbox.paypal.com', '/v1/billing/subscriptions/$payPalUserId');

      DateTime startTime = DateTime.now().add(Duration(hours: 2));

      String formattedStartTime =
          DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(startTime.toUtc());

      final response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$clientid:$secretKey'))}',
        },
        body: json.encode({
          'plan_id': subscriptionPlanEntity.payPalId,
          'start_time': formattedStartTime,
          'application_context': {
            'brand_name': 'YOUR_BRAND_NAME',
            'locale': 'en-US',
            'shipping_preference': 'NO_SHIPPING',
            'user_action': 'SUBSCRIBE_NOW',
            'payment_method': {
              'payer_selected': 'PAYPAL',
              'payee_preferred': 'IMMEDIATE_PAYMENT_REQUIRED',
              'billing_address': {
                'address_line_1': '123 Main St.',
                'admin_area_2': 'San Jose',
                'admin_area_1': 'CA',
                'postal_code': '95131',
                'country_code': 'US',
              },
            },
          },
          'payment_source': {
            'subscriber': {
              'name': {
                'given_name': "Haider",
                'surname': "Ali",
              },
              'email_address': payPalEntity.emaill,
              'credit_card': {
                'number': payPalEntity.cardNumber,
                'expiry': payPalEntity.expiryMonth + payPalEntity.expiryYear,
                'cvv': payPalEntity.cvv,
                'name': "Haider" + '' + "Ali"
              },
            },
          }
        }),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print("success");

        var userSubscripsCritionEntity = UserSubsCriptionModel(
          payPalSubId: subscriptionPlanEntity.payPalId,
          id: subscriptionPlanEntity.id,
          payPalUserId: payPalUserId,
        ).toJson();

        await firebaseFirestore
            .collection("Users")
            .doc(firebaseAuth.currentUser!.uid)
            .update({
          "userSubscripsCritionEntity": userSubscripsCritionEntity
        }).then((value) {
          state = "S";
        });
      } else {}
      return state;
    } on ApiException catch (e) {
      print(e.toString());
      return state;
    }
  }
}
