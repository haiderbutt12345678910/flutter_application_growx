import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/data/model/subscriptionPlanModel.dart';
import 'package:flutter_application_growx/Features/data/model/vedioModel.dart';
import 'package:flutter_application_growx/Features/domain/entities/subscriptionPlanEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/subscriptionusableentity.dart';
import 'package:flutter_application_growx/Features/domain/entities/vediosEntity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AgentBloc/readAgentListCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AuthBloc/isUserLoggedInCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AuthBloc/logInCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AuthBloc/logOutCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AuthBloc/signUpCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/ChatBloc/readChatCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/ChatBloc/updateChatOverViewCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/ChatBloc/writeChatCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/EmailBloc/readEmailsCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/EmailBloc/writeEmailsCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/SubsCriptionPalnsBloc/readSubscriptionPlanbloc.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/updateUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/writeUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/VedioCallBloc/readVedioRequestBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/VedioCallBloc/writeVedioRequestBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/readVedioListBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/updateSubsCriptionBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/AuthScreens/SubscriptionScreens/subscriptiondeatls.dart';
import 'package:flutter_application_growx/splashScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:paypal_sdk/core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'const.dart';
import 'dependencyInjection.dart ' as di;

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //try {
  // AccessToken? accessToken;
  // var basicAuth =
  //     'Basic ${base64Encode(utf8.encode('$clientid:$secretKey'))}';

  // const String authEndpoint =
  //     'https://api.sandbox.paypal.com/v1/oauth2/token';

  // final response = await http.post(Uri.parse(authEndpoint), headers: {
  //   'Accept': 'application/json',
  //   'Accept-Language': 'en_US',
  //   'Authorization': basicAuth,
  // }, body: {
  //   'grant_type': 'client_credentials',
  // });

  // if (response.statusCode == 200) {
  // var paypalEnvironment = const PayPalEnvironment.sandbox(
  //     clientId: clientid, clientSecret: secretKey);
  // String tokken = "";
  // var payPalHttpClient = PayPalHttpClient(paypalEnvironment,
  //     accessTokenUpdatedCallback: (accessToken) async {
  //   tokken = accessToken.accessToken;
  // });

  // var subscriptionsApi = SubscriptionsApi(payPalHttpClient);

  // final url = Uri.https(
  //     'api.sandbox.paypal.com', '/v1/billing/subscriptions/I-CKGLT3VDELWA');

  // final response = await http.patch(
  //   url,
  //   headers: {
  //     'Content-Type': 'application/json',
  //     'Authorization': '',
  //   },
  //   body: json.encode({
  //     'reason': 'Cancelled by customer',
  //     'note': 'Customer decided to cancel',
  //     'cancel_pending_subscriptions': 'true',
  //   }),
  // );
  // print(response.body);
  // if (response.statusCode == 204) {
  //   print('Subscription  cancelled.');
  // } else {
  //   print('Failed to cancel subscription . Response: ${response.body}');
  // }

  // try {
  //   var createSubscriptionRequest = SubscriptionRequest(
  //       applicationContext: ApplicationContext(
  //           returnUrl: returnUrl,
  //           cancelUrl: cancelUrl,
  //           paymentMethod: PaymentMethod()),
  //       quantity: "1",
  //       subscriber: Subscriber(payerId: payerId),
  //       planId: 'P-7W232755KB006763GMQZSLNA',
  //       customId: 'custom_id');
  //   var subscription = await SubscriptionsApi(payPalHttpClient)
  //       .createSubscription(createSubscriptionRequest);
  //   var approvalUrl = subscription.links!
  //       .firstWhere((link) => link.rel == 'approve')
  //       .href;

  //   if (await canLaunchUrl(Uri.parse(approvalUrl))) {
  //     await launchUrl(Uri.parse(approvalUrl));
  //   } else {
  //     throw 'Could not launch $approvalUrl';
  //   }
  // } on ApiException catch (e) {
  //   print(e);
  // }

  // try {
  //   var planCollection =
  //       await subscriptionsApi.captureAuthorizedPaymentOnSubscription(
  //           "P-05L81836SS715672TMQZSJYQ",
  //           SubscriptionCaptureRequest(
  //               note: "subcribe to basic plan",
  //               amount: Money(currencyCode: "USD", value: "20")),
  //           payPalRequestId: tokken);
  //   print(planCollection.payerName);
  // } on ApiException catch (e) {
  //   print(e.toString());
  // }

//P-9B878482AA164140MMQZ2XBI PREMUIM ID
//P-7JX48873HS524620SMQZ2XNQ standadrd id
//P-6DH11119T97720622MQZ2ZHY BASIC ID

// P-5ED87293MP769790TMQQIQAA
// P-8MM50661DL6413946MQQ2CXA
// P-0BK87065H6434212UMQZSIYA
// P-05L81836SS715672TMQZSJYQ
// P-7W232755KB006763GMQZSLNA

  // try {
  //   var a = await subscriptionsApi.listPlans();
  //   a.plans.forEach((element) {
  //     print(element.name);
  //   });
  // } on ApiException catch (e) {
  //   print(e);
  // }

  //   try {
  //     var planRequest = PlanRequest(
  //         productId: 'PROD-991516033J6777021',
  //         name: 'Test plan Basic',
  //         billingCycles: [
  //           BillingCycle(
  //               pricingScheme: PricingScheme(
  //                 fixedPrice: Money(currencyCode: 'USD', value: '199'),
  //               ),
  //               frequency: Frequency(
  //                 intervalUnit: IntervalUnit.year,
  //                 intervalCount: 1,
  //               ),
  //               tenureType: TenureType.regular,
  //               sequence: 1)
  //         ],
  //         paymentPreferences: PaymentPreferences(
  //             autoBillOutstanding: true,
  //             setupFee: Money(currencyCode: 'USD', value: '1.00'),
  //             setupFeeFailureAction: SetupFeeFailureAction.cancel,
  //             paymentFailureThreshold: 2));
  //     var billingPlan = await subscriptionsApi.createPlan(planRequest);
  //     print(billingPlan.id);
  //   } on ApiException catch (e) {
  //     print(e);
  //   }
  // } else {
  //   throw Exception('Failed to get access token: ${response.body}');
  //   }
  // } on ApiException catch (e) {
  //   print(e);
  // }
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static Future<Map<String, dynamic>> createSubscription() async {
    String email = "dodosofttech123@gmail.com";
    String cardNumber = "4032030345318399";
    String cvv = "142";
    String firstName = "Hiader";
    String lastName = "Ali";
    String amount = "50";
    String currency = "USD";
    String description = "";
    String expiryMonth = "09";
    String expiryYear = "2027";

    DateTime startTime = DateTime.now().add(Duration(hours: 1));

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
        'plan_id': 'P-5ED87293MP769790TMQQIQAA',
        'start_time': formattedStartTime,
        'subscriber': {
          'name': {'given_name': firstName, 'surname': lastName},
          'email_address': email,
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
            'number': cardNumber,
            'expiry': expiryMonth + expiryYear,
            'cvv': cvv,
            'name': firstName + ' ' + lastName,
          },
        },
      }),
    );

    if (response.statusCode == 201) {
      // Subscription created successfully
      print("sucess");
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String subscriptionId = responseData['id'];
      return {'success': true, 'subscriptionId': subscriptionId};
    } else {
      print(response.body);
      // Subscription creation failed
      final Map<String, dynamic> errorData = json.decode(response.body);
      return {'success': false, 'error': errorData};
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // createSubscription();
    // addVdios();
    return MultiBlocProvider(
      providers: [
        //update subscription

        BlocProvider<UpdateSubscritionCubit>(
            create: (_) => di.sl<UpdateSubscritionCubit>()),
        //READ vEDIOS
        BlocProvider<RaedVedioListCubit>(
            create: (_) => di.sl<RaedVedioListCubit>()),
        //VedioREQUSTcubits
        BlocProvider<ReadVedioRequestBloc>(
            create: (_) => di.sl<ReadVedioRequestBloc>()),
        BlocProvider<WriteVedioRequestBloc>(
            create: (_) => di.sl<WriteVedioRequestBloc>()),

//chatCubits
        BlocProvider<ReadChatCubit>(create: (_) => di.sl<ReadChatCubit>()),
        BlocProvider<WriteChatCubit>(create: (_) => di.sl<WriteChatCubit>()),
        BlocProvider<UpdateChatOverViewCubit>(
            create: (_) => di.sl<UpdateChatOverViewCubit>()),

// emailcubits
        BlocProvider<ReadEmailsCubit>(create: (_) => di.sl<ReadEmailsCubit>()),
        BlocProvider<WriteEmailsCubit>(
            create: (_) => di.sl<WriteEmailsCubit>()),

        //agentblocs
        BlocProvider<ReadAgentListCubit>(
            create: (_) => di.sl<ReadAgentListCubit>()),

        //userdataBlocs

        BlocProvider<WriteUserCubit>(create: (_) => di.sl<WriteUserCubit>()),
        BlocProvider<ReadUserCubit>(create: (_) => di.sl<ReadUserCubit>()),
        BlocProvider<UpdateUserCubit>(create: (_) => di.sl<UpdateUserCubit>()),

        BlocProvider<LogInCubit>(create: (_) => di.sl<LogInCubit>()),
        BlocProvider<SignUpCubit>(create: (_) => di.sl<SignUpCubit>()),
        BlocProvider<IsUserLoggedInCubit>(
            create: (_) => di.sl<IsUserLoggedInCubit>()),
        BlocProvider<LogOutCubit>(create: (_) => di.sl<LogOutCubit>()),
        BlocProvider<ReadSubscriptionPlanbloc>(
            create: (_) => di.sl<ReadSubscriptionPlanbloc>()),
      ],
      child: MaterialApp(
          title: 'Grow X',
          theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              suffixIconColor: Colors.white,
              prefixIconColor: Colors.white,
              iconColor: Colors.white,
              hintStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontFamily: 'RailWay'),
              labelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontFamily: 'RailWay'),
            ),
            textTheme: const TextTheme(
                titleLarge: TextStyle(
                    fontFamily: 'Race',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22),
                titleMedium: TextStyle(
                    fontFamily: 'Race',
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white),
                titleSmall: TextStyle(
                    fontFamily: 'Race',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                displaySmall: TextStyle(
                    fontFamily: 'RailWay',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),

            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                  fontFamily: 'Race',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              backgroundColor: Colors.teal,
            )),
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: kIsWeb ? WebEntry() : const SplashScreen()),
    );
  }

  addVdios() async {
    List<VediosEntity> vedios = [
      VediosEntity(
          vedioids: [
            "https://www.youtube.com/watch?v=29-ebeGSUzk&list=PL-nr5ImusjMeK0oDtd7uJBOicYBm1f_D5&index=1",
            ""
          ],
          week: 0,
          vedioTitle: ["GrowX | Seed Germination", ""],
          vediodes: [
            "Welcome to GrowX, where we provide expert insights on agricultural practices to help you achieve optimal plant growth. In this video, our esteemed agronomist, Christie Apple, will be discussing the intricate process of seed germination, including an in-depth analysis of the why and how behind it. With years of experience and a wealth of knowledge in the field, Christie's expertise is sure to provide valuable information. Thank you for joining us on this journey towards agricultural excellence with GrowX",
            ""
          ]),
      VediosEntity(
          vedioids: [
            "https://www.youtube.com/watch?v=r_7ISWjYPew&list=PL-nr5ImusjMeK0oDtd7uJBOicYBm1f_D5&index=2",
            ""
          ],
          week: 1,
          vedioTitle: ["GrowX | Transplanting", ""],
          vediodes: [
            "Great to have you back on GrowX! In this second video, our knowledgeable agronomist, Christie Apple, will be discussing the delicate process of transplanting. With her wealth of experience and expertise, Christie will guide you through the various aspects of transplanting, including the best time to transplant, the ideal environmental conditions for successful transplantation, and tips on minimizing transplant shock. At GrowX, we are committed to providing you with the best practices and strategies to optimize your plant growth, and Christie's insights are sure to take you one step closer to achieving your agricultural goals. Thank you for tuning in, and don't forget to subscribe to our channel for more informative content on plant growth and practices.",
            ""
          ]),
      VediosEntity(
          vedioids: [
            "https://www.youtube.com/watch?v=yst4KrSV8sg&list=PL-nr5ImusjMeK0oDtd7uJBOicYBm1f_D5&index=3",
            ""
          ],
          week: 2,
          vedioTitle: ["GrowX | Acclimation", ""],
          vediodes: [
            "Welcome back to GrowX! In this third video, our expert agronomist, Christie Apple, will be discussing the important topic of plant acclimation. Acclimation is a crucial process that prepares plants for changes in their environment, such as transitioning from indoor to outdoor environments, or adapting to changes in light or temperature. Christie will provide you with valuable insights on how to successfully acclimate your plants to their new environment, including tips on adjusting watering schedules, providing proper ventilation, and gradually increasing light exposure. With her extensive knowledge and expertise, Christie's advice will help you optimize your plant growth and ensure that your plants are healthy and robust. Thank you for joining us on GrowX, and be sure to subscribe to our channel.",
            ""
          ]),
      VediosEntity(
          vedioids: ["OhH7iZMWrK8", ""],
          week: 3,
          vedioTitle: ["GrowX | Grow Stage", ""],
          vediodes: [
            "Welcome back to GrowX! In this video, our experienced agronomist, Christie Apple, will be discussing the critical grow stage of plant development. The grow stage is a crucial period in which plants require specific nutrients and environmental conditions to reach their full potential. Christie will provide you with valuable insights on how to support your plants during this stage, including tips on optimal nutrient ratios, lighting requirements, and pH levels. With her wealth of knowledge and experience, Christie's advice will help you achieve optimal growth and yield for your plants.",
            ""
          ]),
      VediosEntity(
          vedioids: [
            "https://www.youtube.com/watch?v=OhH7iZMWrK8&list=PL-nr5ImusjMeK0oDtd7uJBOicYBm1f_D5&index=4",
            ""
          ],
          week: 4,
          vedioTitle: ["", ""],
          vediodes: [
            "Welcome back to GrowX! In this  video, our experienced agronomist, Christie Apple, will be discussing the curing plant development.Christie Apple, the esteemed agronomist featured on GrowX, has a wealth of knowledge and experience in the field of plant growth and development. With her expertise, she provides valuable insights and practical tips on a wide range of agricultural practices. Christies engaging and informative videos are an essential resource for anyone looking to optimize their plant growth through our GrowKits",
            ""
          ]),
      VediosEntity(
          vedioids: [
            "https://www.youtube.com/watch?v=OhH7iZMWrK8&list=PL-nr5ImusjMeK0oDtd7uJBOicYBm1f_D5&index=4",
            ""
          ],
          week: 5,
          vedioTitle: ["GrowX | Transition into Flowering Stage", ""],
          vediodes: [
            "Welcome back to GrowX! In this  video, our experienced agronomist, Christie Apple, will be discussing the flowering stage.Christie Apple, the esteemed agronomist featured on GrowX, has a wealth of knowledge and experience in the field of plant growth and development. With her expertise, she provides valuable insights and practical tips on a wide range of agricultural practices. Christie's engaging and informative videos are an essential resource for anyone looking to optimize their plant growth with our GrowKits.",
            ""
          ]),
      VediosEntity(
          vedioids: ["https://www.youtube.com/watch?v=7uJ8O9mU4NE", ""],
          week: 6,
          vedioTitle: ["GrowX | Pre Flower Phase", ""],
          vediodes: [
            "Welcome back to GrowX! In this video, our expert agronomist, Christie Apple, will be discussing the critical pre-flower phase of plant development. The pre-flower phase is a pivotal stage in which plants begin to form their reproductive structures, and proper care during this phase is essential for healthy and robust growth. Christie will provide you with valuable insights on how to support your plants during this phase, including tips on optimal nutrient ratios, lighting requirements, and environmental conditions. With her extensive knowledge and experience, Christie's advice will help you ensure that your plants are primed for a successful flowering stage.",
            ""
          ]),
      VediosEntity(
          vedioids: ["https://www.youtube.com/watch?v=7uJ8O9mU4NE", ""],
          week: 7,
          vedioTitle: ["GrowX | Early Flowering", ""],
          vediodes: [
            "Welcome back to GrowX! In this  video, our experienced agronomist, Christie Apple, will be discussing the early flowering stage.Christie Apple, the esteemed agronomist featured on GrowX, has a wealth of knowledge and experience in the field of plant growth and development. With her expertise, she provides valuable insights and practical tips on a wide range of agricultural practices. Christie's engaging and informative videos are an essential resource for anyone looking to optimize their plant growth with our GrowKits.",
            ""
          ]),
      VediosEntity(
          vedioids: [
            "https://www.youtube.com/watch?v=OhH7iZMWrK8&list=PL-nr5ImusjMeK0oDtd7uJBOicYBm1f_D5&index=4",
            ""
          ],
          week: 8,
          vedioTitle: ["", ""],
          vediodes: ["", ""]),
      VediosEntity(
          vedioids: [
            "https://www.youtube.com/watch?v=r_fI6bDcn1g&list=PL-nr5ImusjMeK0oDtd7uJBOicYBm1f_D5&index=6",
            ""
          ],
          week: 9,
          vedioTitle: ["GrowX | Flowers Maturing", ""],
          vediodes: ["This is 10th week of your jouney", ""]),
      VediosEntity(
          vedioids: [
            "https://www.youtube.com/watch?v=Fxbv3afjbO8&list=PL-nr5ImusjMeK0oDtd7uJBOicYBm1f_D5&index=7",
            ""
          ],
          week: 10,
          vedioTitle: ["GrowX | Flowering", ""],
          vediodes: ["This is 11th week of your jouney", ""]),
      VediosEntity(
          vedioids: [
            "https://www.youtube.com/watch?v=7mTUz-_QIPo&list=PL-nr5ImusjMeK0oDtd7uJBOicYBm1f_D5&index=8",
            ""
          ],
          week: 11,
          vedioTitle: ["GrowX | Flushing", ""],
          vediodes: ["This is 12th week of your jouney", ""]),
      VediosEntity(
          vedioids: [
            "https://www.youtube.com/watch?v=WiwutpPScqM&list=PL-nr5ImusjMeK0oDtd7uJBOicYBm1f_D5&index=9",
            ""
          ],
          week: 12,
          vedioTitle: ["GrowX | Flower Finish", ""],
          vediodes: ["This is 13th week of your jouney", ""]),
      VediosEntity(
          vedioids: [
            "https://www.youtube.com/watch?v=q8WwJR9oxDw&list=PL-nr5ImusjMeK0oDtd7uJBOicYBm1f_D5&index=10",
            ""
          ],
          week: 13,
          vedioTitle: ["GrowX | Harvest", ""],
          vediodes: ["This is 14th week of your jouney", ""]),
      VediosEntity(
          vedioids: [
            "https://www.youtube.com/watch?v=m4itfep-mS8&list=PL-nr5ImusjMeK0oDtd7uJBOicYBm1f_D5&index=11-mS8",
            ""
          ],
          week: 14,
          vedioTitle: ["GrowX | Drying", ""],
          vediodes: ["This is 15th week of your jouney", ""]),
      VediosEntity(
          vedioids: [
            "https://www.youtube.com/watch?v=DZY6TZ-dLew&list=PL-nr5ImusjMeK0oDtd7uJBOicYBm1f_D5&index=12",
            ""
          ],
          week: 15,
          vedioTitle: [
            "GrowX | Curing - week 16",
            "This is 16th week of your jouney"
          ],
          vediodes: ["", ""]),
    ];

    try {
      for (int i = 0; i < vedios.length; i++) {
        var model = VedioModel(
                vedioTitle: [vedios[i].vedioTitle![0], ""],
                vediodes: [vedios[i].vediodes![0], ""],
                vedioids: [vedios[i].vedioids![0], ""],
                week: vedios[i].week)
            .toJson();
        CollectionReference collectionRef =
            FirebaseFirestore.instance.collection('Vedios');
        await collectionRef.doc('w$i').set(model).then((value) {});
      }

      // WriteBatch batch = FirebaseFirestore.instance.batch();

      // for (int i = 0; i < vedios.length; i++) {
      //   var model = VedioModel(
      //           vedioTitle: vedios[i].vedioTitle,
      //           vediodes: vedios[i].vediodes,
      //           vedioids: vedios[i].vedioids,
      //           week: vedios[i].week)
      //       .toJson();
      //   batch.set(collectionRef.doc('Week$i'), model);
      //  }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void addMultipleDocs() {
    String basic = const Uuid().v4();
    String standard = const Uuid().v4();

    String premium = const Uuid().v4();

    // Get a reference to the Firestore collection
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('SubsCriptionPlans');
    List<dynamic> standardList = [
      Subscriptionusableentity(
          isAvaialible: true, option: 'Every incredible feature of GrowX AI'),
      Subscriptionusableentity(
          isAvaialible: true,
          option:
              'All future updates for GrowX AI as long as you are a subscriber'),
      Subscriptionusableentity(
          isAvaialible: false,
          option: 'More than 50% off each monthly subscription'),
      Subscriptionusableentity(
          isAvaialible: false,
          option: 'More than 50% off each monthly subscription'),
    ];

    // Create a batch object
    WriteBatch batch = FirebaseFirestore.instance.batch();
    Map<String, dynamic> plan1 = SubscriptionPlanModel(
            discountedAmount: "0",
            subscriptionPeriod: "30",
            name: "Basic",
            baseAmount: "0",
            trialAmount: "0",
            trialPeriod: "6",
            uid: basic,
            title:
                "Get the best of Homegrown Pros plus the best of GrowX AI for the next 365 days. Subscribing for a year saves you more than half off each monthly subscription.",
            optionList: standardList)
        .toJson();
    Map<String, dynamic> plan2 = SubscriptionPlanModel(
            subscriptionPeriod: "30",
            discountedAmount: "0",
            name: "Standard",
            baseAmount: "0",
            trialAmount: "0",
            trialPeriod: "1",
            uid: standard,
            title:
                "Get the best of Homegrown Pros plus the best of GrowX AI for the next 365 days. Subscribing for a year saves you more than half off each monthly subscription.",
            optionList: standardList)
        .toJson();
    Map<String, dynamic> plan3 = SubscriptionPlanModel(
            discountedAmount: "0",
            subscriptionPeriod: "30",
            name: "Premium",
            baseAmount: "0",
            trialAmount: "0",
            trialPeriod: "6",
            uid: premium,
            title:
                "Get the best of Homegrown Pros plus the best of GrowX AI for the next 365 days. Subscribing for a year saves you more than half off each monthly subscription.",
            optionList: standardList)
        .toJson();

    // Add multiple documents to the batch
    batch.set(collectionRef.doc(basic), plan1);
    batch.set(collectionRef.doc(standard), plan2);
    batch.set(collectionRef.doc(premium), plan3);

    // Commit the batch
    batch
        .commit()
        .then((value) => print('Batch write successful!'))
        .catchError((error) => print('Batch write failed: $error'));
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                makePaymet(10);
              },
              child: Text("PayNOW")),
        ),
      ),
    );
  }

  void makePaymet(double price) async {
    String clientId = clientid;
    String secret = secretKey;
    String token = base64.encode(utf8.encode("$clientId:$secret"));
    String apiUrl = "https://api.sandbox.paypal.com/v1/";

    // Set up payment details
    double amount = 10; // amount to be paid
    String currency = "USD"; // currency code
    String description = "Test payment"; // payment description

    // Construct API request
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Basic $token",
    };
    Map<String, dynamic> requestBody = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {"total": amount.toString(), "currency": currency},
          "description": description
        }
      ],
      "redirect_urls": {
        "return_url": "http://localhost:61100/#/",
        "cancel_url": "http://localhost:61100/#/"
      }
    };
    String url = "$apiUrl/payment";
    http.Response response = await http.post(Uri.parse(url),
        headers: headers, body: json.encode(requestBody));

    // Process API response
    if (response.statusCode == 201) {
      // Payment created successfully
      Map<String, dynamic> responseData = json.decode(response.body);
      String approvalUrl = responseData['links']
          .firstWhere((link) => link['rel'] == 'approval_url')['href'];

      if (await canLaunchUrl(Uri.parse(approvalUrl))) {
        await launchUrl(Uri.parse(approvalUrl));
      } else {
        throw 'Could not launch $approvalUrl';
      }

      // Redirect the user to the approval URL to complete the payment
      print("Payment created successfully. Approval URL: $approvalUrl");
    } else {
      // Payment creation failed
      print("Failed to create payment: ${response.statusCode}");
    }
  }
}

class WebEntry extends StatelessWidget {
  WebEntry({super.key});
  String pass = "";

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then(
      (value) {
        showdialog(context);
      },
    );

    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
    ));
  }

  void showdialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text('Alert'),
          content: const Text('Enter the GrowX password.'),
          actions: [
            Container(
              width: double.infinity,
              child: TextFormField(
                onChanged: (val) {
                  pass = val;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                if (pass == "123456") {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SplashScreen()),
                  );
                } else {
                  var snackBar = const SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text("Wrong key"),
                    backgroundColor: Colors.red,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}
