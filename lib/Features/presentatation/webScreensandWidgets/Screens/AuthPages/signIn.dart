import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/AuthPages/register.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/footer.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/global/header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constvar.dart';
import '../../../bloc/AuthBloc/isUserLoggedInCubit.dart';
import '../../../bloc/AuthBloc/logInCubit.dart';
import '../../../bloc/UserDataBloc/readUserCubit.dart';
import '../../../bloc/blocstate.dart';
import '../../../widgets/backgroundgradientcontainer.dart';
import '../../../widgets/gloablwidgets/heading.dart';
import '../../../widgets/gloablwidgets/progresscircularbarindicator.dart';
import '../landingPage.dart';

class WebSignIn extends StatefulWidget {
  const WebSignIn({super.key});

  @override
  State<WebSignIn> createState() => _WebSignInState();
}

class _WebSignInState extends State<WebSignIn> {
  final key = GlobalKey<FormState>();
  final emaiController = TextEditingController();
  final passwordController = TextEditingController();

  bool isvisblepass = true;

  @override
  void dispose() {
    emaiController.dispose();
    passwordController.dispose();
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
                  BlocConsumer<LogInCubit, BlocStates>(
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
                                    height: size.height,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            width: size.width * .3,
                                            height: size.height,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Heading(
                                                    heading: loginheading,
                                                    subHeading:
                                                        loginsubheading),
                                                const SizedBox(
                                                  height: 60,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: TextFormField(
                                                    cursorColor: Colors.white,
                                                    validator: (val) {
                                                      final emailRegex = RegExp(
                                                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
                                                      );
                                                      if (val!.isEmpty) {
                                                        return "Feild is Required";
                                                      } else if (!emailRegex
                                                          .hasMatch(val)) {
                                                        return "Input Valid Email (e.x abc@gmail.com)";
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    decoration:
                                                        const InputDecoration(
                                                            prefixIcon: Icon(
                                                                Icons.email),
                                                            hintText:
                                                                "Enter Email here(e.x abc@gmail.com)"),
                                                    controller: emaiController,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 30,
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  child: TextFormField(
                                                    obscureText: isvisblepass,
                                                    cursorColor: Colors.white,
                                                    validator: (val) {
                                                      if (val!.isEmpty) {
                                                        return "Feild is Required";
                                                      } else if (val.length <
                                                          6) {
                                                        return "Wrong Password!";
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    decoration: InputDecoration(
                                                        prefixIcon: const Icon(
                                                            Icons.lock),
                                                        suffixIcon:
                                                            GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    if (isvisblepass ==
                                                                        false) {
                                                                      isvisblepass =
                                                                          true;
                                                                    } else {
                                                                      isvisblepass =
                                                                          false;
                                                                    }
                                                                  });
                                                                },
                                                                child: const Icon(
                                                                    Icons
                                                                        .visibility)),
                                                        hintText:
                                                            "Enter Password Here"),
                                                    keyboardType:
                                                        TextInputType.text,
                                                    controller:
                                                        passwordController,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 60,
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
                                                                        const WebSignUp()),
                                                          );
                                                        },
                                                        child: Text(
                                                          signup,
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
                                                  height: 80,
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
                                                      child: const Text(login)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
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
                                    color: Colors.white,
                                    width: double.infinity,
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
                  TopBar(clicked: 5)
                ],
              ),
            )),
      ),
    );
  }

  void submit(BuildContext buildContext) {
    if (key.currentState!.validate()) {
      BlocProvider.of<LogInCubit>(context)
          .logIn(emaiController.text, passwordController.text);
    } else {
      return;
    }
  }
}
