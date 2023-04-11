import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/updateUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/homeScreen.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/progresscircularbarindicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constvar.dart';
import '../bloc/blocstate.dart';

class ProfilePage extends StatefulWidget {
  final int id;
  const ProfilePage({super.key, required this.id});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = TextEditingController();
  File? image;
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    BlocProvider.of<ReadUserCubit>(context).readUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Form(
        key: formKey,
        child: Stack(
          children: [
            const BackGroundGradientContainer(),
            BlocConsumer<UpdateUserCubit, BlocStates>(
                builder: ((context, state) {
              Userdataentity a =
                  BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();

              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Heading(
                              heading: "Complete Your Personal Profile",
                              subHeading: ""),
                          InkWell(
                            onTap: () {
                              getFromGallery();
                            },
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 100.0,
                                backgroundImage: image != null
                                    ? FileImage(File(image!.path))
                                    : NetworkImage(a.imageUrl != null
                                            ? a.imageUrl as String
                                            : "https://www.clipartkey.com/mpngs/m/29-297748_round-profile-image-placeholder.png")
                                        as ImageProvider),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Feild is Required";
                                } else {
                                  return null;
                                }
                              },
                              controller: controller,
                              decoration: const InputDecoration(
                                hintText: "Enter User Name",
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
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
                  ),
                  if (state is Loading) const ProgressCircularIndicatorCustom()
                ],
              );
            }), listener: (context, state) {
              if (state is Sucessfull) {
                var snackBar = const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text(successsnackbartext),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                if (widget.id == 0) {
                  Navigator.of(context).pop();
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }
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
      )),
    );
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

  void submit(BuildContext context) {
    var a = formKey.currentState!.validate();
    if (a) {
      if (image == null) {
        var snackBar = const SnackBar(
          duration: Duration(seconds: 1),
          content: Text("Please Select Image"),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      Userdataentity userDataEntity = Userdataentity(
        name: controller.text,
      );
      try {
        BlocProvider.of<UpdateUserCubit>(context)
            .updateUserData(userDataEntity, image, null);
      } on Exception catch (e) {
        print(e.toString());
      }
    } else {
      return;
    }
  }
}
