import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/agentEmailEntity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/EmailBloc/writeEmailsCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/progresscircularbarindicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constvar.dart';

class CreateEmail extends StatefulWidget {
  const CreateEmail({super.key});

  @override
  State<CreateEmail> createState() => _CreateEmailState();
}

class _CreateEmailState extends State<CreateEmail> {
  final key = GlobalKey<FormState>();
  final emailEDitingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var a = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.send,
              color: Colors.black,
            ),
            onPressed: () {
              submit(context);
              //NAVIGATE TO
            }),
        body: Form(
          key: key,
          child: Stack(
            children: [
              const BackGroundGradientContainer(),
              BlocConsumer<WriteEmailsCubit, BlocStates>(
                  builder: ((context, state) {
                return Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Heading(
                              heading: "EmaiL To CustomerSupport",
                              subHeading: "Get Respons In 24 Hours"),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: const BoxDecoration(),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            width: double.infinity,
                            child: TextFormField(
                              minLines: 8,
                              maxLines: 8,
                              cursorColor: Colors.white,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Feild Cant be Empty";
                                } else {
                                  return null;
                                }
                              },
                              controller: emailEDitingController,
                              decoration: const InputDecoration(
                                  hintText: "Write Mail Here"),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (state is Loading)
                      const ProgressCircularIndicatorCustom()
                  ],
                );
              }), listener: (ctx, state) {
                if (state is Sucessfull) {
                  var snackBar = const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text(successsnackbartext),
                    backgroundColor: Colors.green,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  // var a = BlocProvider.of<ReadUserCubit>(context)
                  //     .readUserDataLocall();
                  // BlocProvider.of<ReadEmailsCubit>(context)
                  //     .readEmails(a.agentId as String)
                  //     .then((value) {});

                  Navigator.of(context).pop();
                }

                if (state is Failure) {
                  var snackBar = const SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text(faliuresnackbartext),
                    backgroundColor: Colors.red,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  void submit(BuildContext context) {
    var a = key.currentState!.validate();

    if (a) {
      var readUser =
          BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
      DateTime dateTime = DateTime.now().toLocal();
      String? crartedAt = dateTime.toString();
      UserEmailEntity emailEntity = UserEmailEntity(
        createdAt: crartedAt,
        reply: "",
        userName: readUser.name,
        email: emailEDitingController.text,
        imgUrl: readUser.imageUrl,
      );
      BlocProvider.of<WriteEmailsCubit>(context)
          .writeEmail(emailEntity, readUser.agentId as String);
    } else {
      return;
    }
  }
}
