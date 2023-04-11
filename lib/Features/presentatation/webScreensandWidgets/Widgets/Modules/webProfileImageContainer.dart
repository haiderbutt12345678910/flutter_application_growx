import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../bloc/localCubit/uerplantdataStatic.dart';

class WebProfileImageContainer extends StatefulWidget {
  const WebProfileImageContainer({super.key});

  @override
  State<WebProfileImageContainer> createState() =>
      _WebProfileImageContainerState();
}

class _WebProfileImageContainerState extends State<WebProfileImageContainer> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getFromGallery();
      },
      child: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 100,
          backgroundImage: image == null ? null : NetworkImage(image!.path)),
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

        UserPlantStatic.profileImage = await pickedFile.readAsBytes();
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }
}
