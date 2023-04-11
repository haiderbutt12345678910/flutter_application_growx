import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AgentBloc/readAgentListCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AuthBloc/isUserLoggedInCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AuthBloc/signUpCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/localCubit/uerplantdataStatic.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/AuthPages/signIn.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/landingPage.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/footer.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/global/header.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/progresscircularbarindicator.dart';
import 'package:flutter_application_growx/constvar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/UserEntities/userdataentity.dart';
import '../../Widgets/Modules/webProfileImageContainer.dart';

class WebSignUp extends StatefulWidget {
  const WebSignUp({super.key});

  @override
  State<WebSignUp> createState() => _WebSignUpState();
}

class _WebSignUpState extends State<WebSignUp> {
  final key = GlobalKey<FormState>();
  final emaiController = TextEditingController();
  final adressController = TextEditingController();
  final numberController = TextEditingController();
  final nameController = TextEditingController();

  final passwordController = TextEditingController();

  final confirPasswordController = TextEditingController();
  bool isvisblepass = true;
  bool isvisbleconfrmpass = true;

  @override
  void dispose() {
    nameController.dispose();
    adressController.dispose();
    numberController.dispose();
    emaiController.dispose();
    passwordController.dispose();
    confirPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Form(
            key: key,
            child: Container(
              color: Colors.black,
              child: Stack(
                children: [
                  BlocConsumer<SignUpCubit, BlocStates>(
                      builder: ((context, state) {
                    return SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            width: size.width * .35,
                                            height: size.height,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: size.height * .17,
                                                  color: Colors.black,
                                                ),
                                                const Heading(
                                                    heading: signupheading,
                                                    subHeading:
                                                        signupsubheading),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const WebProfileImageContainer(),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: 100,
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 10),
                                                        child: TextFormField(
                                                          validator: (val) {
                                                            if (val!.isEmpty) {
                                                              return "Feild is Required";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          controller:
                                                              nameController,
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                "Enter Your Name",
                                                            prefixIcon: Icon(
                                                                Icons.person),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 6,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        width: 100,
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 10),
                                                        child: TextFormField(
                                                          cursorColor:
                                                              Colors.white,
                                                          validator: (val) {
                                                            final emailRegex =
                                                                RegExp(
                                                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
                                                            );
                                                            if (val!.isEmpty) {
                                                              return "Feild is Required";
                                                            } else if (!emailRegex
                                                                .hasMatch(
                                                                    val)) {
                                                              return "Input Valid Email (e.x abc@gmail.com)";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          keyboardType:
                                                              TextInputType
                                                                  .emailAddress,
                                                          decoration:
                                                              const InputDecoration(
                                                                  prefixIcon:
                                                                      Icon(Icons
                                                                          .email),
                                                                  hintText:
                                                                      "Enter Email here(e.x abc@gmail.com)"),
                                                          controller:
                                                              emaiController,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: 100,
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 10),
                                                        child: TextFormField(
                                                          obscureText:
                                                              isvisblepass,
                                                          cursorColor:
                                                              Colors.white,
                                                          validator: (val) {
                                                            if (val!.isEmpty) {
                                                              return "Feild is Required";
                                                            } else if (val
                                                                    .length <
                                                                6) {
                                                              return "Password must be greater than 6 digits";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                                  prefixIcon:
                                                                      const Icon(
                                                                          Icons
                                                                              .lock),
                                                                  suffixIcon:
                                                                      GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              if (isvisblepass == false) {
                                                                                isvisblepass = true;
                                                                              } else {
                                                                                isvisblepass = false;
                                                                              }
                                                                            });
                                                                          },
                                                                          child: const Icon(Icons
                                                                              .visibility)),
                                                                  hintText:
                                                                      "Enter Password Here"),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          controller:
                                                              passwordController,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        width: 100,
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 10),
                                                        child: TextFormField(
                                                          obscureText:
                                                              isvisbleconfrmpass,
                                                          cursorColor:
                                                              Colors.white,
                                                          validator: (val) {
                                                            if (val!.isEmpty) {
                                                              return "Feild is Required";
                                                            } else if (val
                                                                    .length <
                                                                6) {
                                                              return "Password must be greater than 6 digits";
                                                            } else if (passwordController
                                                                    .text !=
                                                                val) {
                                                              return "Password does not match";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Confirm Password Here",
                                                            prefixIcon:
                                                                const Icon(
                                                                    Icons.lock),
                                                            suffixIcon:
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        if (isvisbleconfrmpass ==
                                                                            false) {
                                                                          isvisbleconfrmpass =
                                                                              true;
                                                                        } else {
                                                                          isvisbleconfrmpass =
                                                                              false;
                                                                        }
                                                                      });
                                                                    },
                                                                    child: const Icon(
                                                                        Icons
                                                                            .visibility)),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          controller:
                                                              confirPasswordController,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: 100,
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 10),
                                                        child: TextFormField(
                                                          validator: (val) {
                                                            if (val!.isEmpty) {
                                                              return "Feild is Required";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          controller:
                                                              adressController,
                                                          decoration: const InputDecoration(
                                                              hintText:
                                                                  "Enter Your Adress",
                                                              prefixIcon: Icon(Icons
                                                                  .location_city)),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        width: 100,
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 10),
                                                        child: TextFormField(
                                                          validator: (val) {
                                                            if (val!.isEmpty) {
                                                              return "Feild is Required";
                                                            } else {
                                                              return null;
                                                            }
                                                          },
                                                          controller:
                                                              numberController,
                                                          decoration:
                                                              const InputDecoration(
                                                                  hintText:
                                                                      "Enter Phone Number",
                                                                  prefixIcon:
                                                                      Icon(Icons
                                                                          .phone)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        signupbuttontext,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displaySmall,
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          //Navigate to LogiN screen
                                                          Navigator
                                                              .pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const WebSignIn()),
                                                          );
                                                        },
                                                        child: Text(
                                                          login,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleSmall!
                                                              .copyWith(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                  decorationColor:
                                                                      Colors
                                                                          .white),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  width: double.infinity,
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        submit(context);
                                                      },
                                                      child:
                                                          const Text(signup)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: size.height * .8,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "Asset/webimages/auth.png"))),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    height: size.height * .5,
                                    child: const Footer(),
                                  )
                                ],
                              ),
                            ),
                          ),
                          if (state is Loading)
                            const ProgressCircularIndicatorCustom()
                        ],
                      ),
                    );
                  }), listener: (ctx, state) {
                    if (state is Sucessfull) {
                      var snackBar = const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text(successsnackbartext),
                        backgroundColor: Colors.green,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      BlocProvider.of<ReadUserCubit>(context)
                          .readUserData()
                          .then((value) {
                        BlocProvider.of<IsUserLoggedInCubit>(context)
                            .isUserLoggedIn()
                            .then((value) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LandigPage()),
                          );
                        });
                      });
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
                  TopBar(clicked: 5),
                ],
              ),
            )),
      ),
    );
  }

  void submit(BuildContext buildContext) {
    if (key.currentState!.validate()) {
      if (UserPlantStatic.profileImage == null) {
        var snackBar = const SnackBar(
          duration: Duration(seconds: 1),
          content: Text("Plaese Select an Image"),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        var agents =
            BlocProvider.of<ReadAgentListCubit>(context).readListLocall();
        int index = agents.length - 1;
        int userCount = int.parse(agents[index].userCount as String);
        userCount = userCount + 1;
        String updatedCount = userCount.toString();
        var userdata = Userdataentity(
            adress: adressController.text,
            name: nameController.text,
            phoneNumber: numberController.text);
        BlocProvider.of<SignUpCubit>(context).signUp(
            emaiController.text,
            passwordController.text,
            agents[index].id as String,
            updatedCount,
            userdata,
            null,
            UserPlantStatic.profileImage as Uint8List);
      }
    } else {
      return;
    }
  }
}
