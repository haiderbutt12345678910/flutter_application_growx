import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final nametextEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nametextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nametextEditingController = TextEditingController();

    var a = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Stack(
          children: [
            const BackGroundGradientContainer(),
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const Heading(heading: "USER PROFILE", subHeading: ""),
                  const SizedBox(
                    height: 20,
                  ),

                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 50,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     _getFromGallery();
                  //   },
                  //   child: CircleAvatar(
                  //       radius: 100.0,
                  //       backgroundImage: image != null
                  //           ? FileImage(File(image!.path))
                  //           : NetworkImage(widget.userDataEntity!.imgUrl != ""
                  //                   ? widget.userDataEntity!.imgUrl as String
                  //                   : "https://www.clipartkey.com/mpngs/m/29-297748_round-profile-image-placeholder.png")
                  //               as ImageProvider),
                  // ),
                  TextFormField(
                    controller: nametextEditingController,
                    decoration: const InputDecoration(
                      hintText: "Enter Your Name",
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _getFromGallery() async {
  //   try {
  //     XFile? pickedFile = await ImagePicker().pickImage(
  //       imageQuality: 10,
  //       source: ImageSource.gallery,
  //       maxWidth: 512,
  //       maxHeight: 512,
  //     );
  //     if (pickedFile != null) {
  //       setState(() {
  //         image = File(pickedFile.path);
  //       });
  //     }
  //   } catch (e) {
  //     print("Error picking image: $e");
  //   }
}
