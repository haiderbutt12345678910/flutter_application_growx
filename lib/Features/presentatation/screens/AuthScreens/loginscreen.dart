import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AuthBloc/logInCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/AuthScreens/SubscriptionScreens/subscriptionoverView.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/AuthScreens/signupscreen.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/progresscircularbarindicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constvar.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final key = GlobalKey<FormState>();
  final emaiController = TextEditingController();
  final passwordController = TextEditingController();

  final confirPasswordController = TextEditingController();
  bool isvisblepass = true;
  bool isvisbleconfrmpass = true;

  @override
  void dispose() {
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
            child: BlocConsumer<LogInCubit, BlocStates>(
                builder: ((context, state) {
              return Stack(
                children: [
                  const BackGroundGradientContainer(),
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      height: size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Heading(
                              heading: loginheading,
                              subHeading: loginsubheading),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              validator: (val) {
                                final emailRegex = RegExp(
                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
                                );
                                if (val!.isEmpty) {
                                  return "Feild is Required";
                                } else if (!emailRegex.hasMatch(val)) {
                                  return "Input Valid Email (e.x abc@gmail.com)";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  hintText:
                                      "Enter Email here(e.x abc@gmail.com)"),
                              controller: emaiController,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              obscureText: isvisblepass,
                              cursorColor: Colors.white,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Feild is Required";
                                } else if (val.length < 6) {
                                  return "Password must be greater than 6 digits";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (isvisblepass == false) {
                                            isvisblepass = true;
                                          } else {
                                            isvisblepass = false;
                                          }
                                        });
                                      },
                                      child: const Icon(Icons.visibility)),
                                  hintText: "Enter Password Here"),
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  signupbuttontext,
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                TextButton(
                                  onPressed: () {
                                    //Navigate to LogiN screen
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpScreen()),
                                    );
                                  },
                                  child: Text(
                                    signup,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
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

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SubsCriptionOverViewScreen()),
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
            })),
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
