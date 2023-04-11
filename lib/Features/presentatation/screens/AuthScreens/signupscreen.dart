import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AgentBloc/readAgentListCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AuthBloc/signUpCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/AuthScreens/SubscriptionScreens/subscriptionoverView.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/AuthScreens/loginscreen.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/progresscircularbarindicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constvar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final key = GlobalKey<FormState>();
  final emaiController = TextEditingController();
  final adressController = TextEditingController();
  final numberController = TextEditingController();
  final nameController = TextEditingController();

  final passwordController = TextEditingController();

  final confirPasswordController = TextEditingController();
  bool isvisblepass = true;
  bool isvisbleconfrmpass = true;
  File? image;

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
            child: BlocConsumer<SignUpCubit, BlocStates>(
                builder: ((context, state) {
              return Stack(
                children: [
                  const BackGroundGradientContainer(),
                  Container(
                    width: double.infinity,
                    height: size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Heading(
                              heading: signupheading,
                              subHeading: signupsubheading),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              getFromGallery();
                            },
                            child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 100.0,
                                backgroundImage: image != null
                                    ? FileImage(File(image!.path))
                                    : null),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Feild is Required";
                                } else {
                                  return null;
                                }
                              },
                              controller: nameController,
                              decoration: const InputDecoration(
                                hintText: "Enter Your Name",
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
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
                            height: 15,
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              obscureText: isvisbleconfrmpass,
                              cursorColor: Colors.white,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Feild is Required";
                                } else if (val.length < 6) {
                                  return "Password must be greater than 6 digits";
                                } else if (passwordController.text != val) {
                                  return "Password does not match";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "Confirm Password Here",
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isvisbleconfrmpass == false) {
                                          isvisbleconfrmpass = true;
                                        } else {
                                          isvisbleconfrmpass = false;
                                        }
                                      });
                                    },
                                    child: const Icon(Icons.visibility)),
                              ),
                              keyboardType: TextInputType.text,
                              controller: confirPasswordController,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Feild is Required";
                                } else {
                                  return null;
                                }
                              },
                              controller: adressController,
                              decoration: const InputDecoration(
                                  hintText: "Enter Your Adress",
                                  prefixIcon: Icon(Icons.location_city)),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Feild is Required";
                                } else {
                                  return null;
                                }
                              },
                              controller: numberController,
                              decoration: const InputDecoration(
                                  hintText: "Enter Phone Number",
                                  prefixIcon: Icon(Icons.phone)),
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
                                              const LogInScreen()),
                                    );
                                  },
                                  child: Text(
                                    login,
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
                                child: const Text(signup)),
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
      if (image == null) {
        var snackBar = const SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Select Image please"),
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
            image,
            null);
      }
    } else {
      return;
    }
  }

  getFromGallery() async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        imageQuality: 10,
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
      );
      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }
}
