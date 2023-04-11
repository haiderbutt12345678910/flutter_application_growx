import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/payPalEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/subscriptionPlanEntity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/updateSubsCriptionBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/progresscircularbarindicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/UserDataBloc/readUserCubit.dart';

class ProcessPayment extends StatefulWidget {
  final SubscriptionPlanEntity subscriptionPlanEntity;
  const ProcessPayment({super.key, required this.subscriptionPlanEntity});

  @override
  State<ProcessPayment> createState() => _ProcessPaymentState();
}

class _ProcessPaymentState extends State<ProcessPayment> {
  final emailController =
      TextEditingController(text: "dodosofttech123@gmail.com");
  final cardNumberController = TextEditingController(text: "4032030345318399");
  final cvvController = TextEditingController(text: "142");
  final expiryController = TextEditingController(text: "09/2027");
  final holderNameController = TextEditingController(text: "hAIDER aLI");
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Form(
            key: formkey,
            child: BlocConsumer<UpdateSubscritionCubit, BlocStates>(
                builder: (ctx, state) {
              return Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 200),
                    width: double.infinity,
                    height: size.height,
                    child: Card(
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Heading(
                              heading: "Enter Card Details", subHeading: ""),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            child: TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                } else {
                                  return null;
                                }
                              },
                              controller: emailController,
                              decoration: const InputDecoration(
                                  hintText: "Enter Your PAYPAL Email"),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            child: TextFormField(
                              controller: cardNumberController,
                              validator: (val) {
                                if (val!.isEmpty) {
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                  hintText: "Card Number"),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextFormField(
                                    controller: expiryController,
                                    decoration: const InputDecoration(
                                        hintText: "11/25"),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: TextFormField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: cvvController,
                                    decoration: const InputDecoration(
                                        hintText: "Enter Cvv"),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                } else {
                                  return null;
                                }
                              },
                              controller: holderNameController,
                              decoration: const InputDecoration(
                                  hintText: "Enter Card Holder Name"),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 60),
                            child: ElevatedButton(
                                onPressed: () {
                                  submit(context);
                                },
                                child: const Text("Subscribe Now")),
                          )
                        ],
                      ),
                    ),
                  ),
                  if (state is Loading) const ProgressCircularIndicatorCustom()
                ],
              );
            }, listener: (ctx, state) {
              if (state is Sucessfull) {
                BlocProvider.of<ReadUserCubit>(context)
                    .readUserData()
                    .then((value) {
                  Navigator.of(context).pop();
                });
              }
              if (state is Failure) {
                var snackBar = const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text("SomeTing Wnet Wrong!Try Again"),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            })));
  }

  void submit(BuildContext buildContext) {
    String expiryyear =
        expiryController.text.substring(expiryController.text.length - 2);

    String expritymonth = expiryController.text.substring(0, 2);
    PayPalEntity palEntity = PayPalEntity(
        emaill: emailController.text,
        cardNumber: cardNumberController.text,
        cvv: cvvController.text,
        firstName: holderNameController.text,
        lastName: holderNameController.text,
        expiryMonth: expritymonth,
        expiryYear: expiryyear);

    var a = BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
    BlocProvider.of<UpdateSubscritionCubit>(context)
        .updateSubscription(palEntity, widget.subscriptionPlanEntity);
  }
}
