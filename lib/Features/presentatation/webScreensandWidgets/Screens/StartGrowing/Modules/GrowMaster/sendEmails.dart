import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/agentEmailEntity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/EmailBloc/writeEmailsCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/global/header.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/progresscircularbarindicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../constvar.dart';
import '../../mainpage.dart';

class WebSendEmails extends StatefulWidget {
  const WebSendEmails({super.key});

  @override
  State<WebSendEmails> createState() => _WebSendEmailsState();
}

class _WebSendEmailsState extends State<WebSendEmails> {
  final key = GlobalKey<FormState>();
  final emailEDitingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: key,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
            child: BlocConsumer<WriteEmailsCubit, BlocStates>(
                builder: ((context, state) {
              return Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      children: [
                        TopBar(clicked: 4),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                width: size.width * .5,
                                alignment: Alignment.topRight,
                                child: Text(
                                  "",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              Container(
                                  padding: const EdgeInsets.only(right: 30),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  width: size.width * .5,
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WebAccessPage(
                                                      pageId: 0,
                                                    )),
                                          );
                                        },
                                        child: SizedBox(
                                            width: 80,
                                            height: 80,
                                            child: Image.asset(
                                              "Asset/images/Growlog color.png",
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WebAccessPage(
                                                      pageId: 1,
                                                    )),
                                          );
                                        },
                                        child: SizedBox(
                                            width: 80,
                                            height: 80,
                                            child: Image.asset(
                                              "Asset/images/GrowTrack Color.png",
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WebAccessPage(
                                                      pageId: 2,
                                                    )),
                                          );
                                        },
                                        child: SizedBox(
                                            width: 80,
                                            height: 80,
                                            child: Image.asset(
                                              "Asset/images/GrowMaster Color.png",
                                            )),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        const Heading(
                            heading: "EmaiL To CustomerSupport",
                            subHeading: "Get Respons In 24 Hours"),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(),
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            width: double.infinity,
                            child: TextFormField(
                              minLines: 20,
                              maxLines: 20,
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
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 350, vertical: 20),
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                submit(context);
                              },
                              child: const Text("Submit")),
                        )
                      ],
                    ),
                  ),
                  if (state is Loading) const ProgressCircularIndicatorCustom()
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

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebAccessPage(
                            pageId: 2,
                          )),
                );
              }

              if (state is Failure) {
                var snackBar = const SnackBar(
                  duration: Duration(seconds: 2),
                  content: Text(faliuresnackbartext),
                  backgroundColor: Colors.red,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }),
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
