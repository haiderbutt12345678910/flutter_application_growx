import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../bloc/localCubit/uerplantdataStatic.dart';

class WebPlantImageContainer extends StatefulWidget {
  const WebPlantImageContainer({super.key});

  @override
  State<WebPlantImageContainer> createState() => _WebPlantImageContainerState();
}

class _WebPlantImageContainerState extends State<WebPlantImageContainer> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getFromGallery();
      },
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 270,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 2.0,
            ),
            image: image == null
                ? null
                : kIsWeb
                    ? DecorationImage(
                        image: NetworkImage(image!.path), fit: BoxFit.cover)
                    : DecorationImage(
                        image: FileImage(
                          File(image!.path),
                        ),
                        fit: BoxFit.cover),
          ),
          child: image != null
              ? null
              : Image.asset(
                  "Asset/images/addimage.png",
                  fit: BoxFit.contain,
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

        UserPlantStatic.plantImage = await pickedFile.readAsBytes();
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }
}
