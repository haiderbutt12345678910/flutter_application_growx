import 'package:flutter/material.dart';

class BackGroundGradientContainer extends StatelessWidget {
  const BackGroundGradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("Asset/images/bg.png"), fit: BoxFit.cover)),
    );
  }
}
