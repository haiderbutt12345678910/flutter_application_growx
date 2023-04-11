import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../bloc/localCubit/uerplantdataStatic.dart';

class PlantContainerImage extends StatefulWidget {
  const PlantContainerImage({super.key});

  @override
  State<PlantContainerImage> createState() => _PlantContainerImageState();
}

class _PlantContainerImageState extends State<PlantContainerImage> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getFromGallery();
      },
      child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 150,
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
          UserPlantStatic.plantImgMbl = image;
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }
}
