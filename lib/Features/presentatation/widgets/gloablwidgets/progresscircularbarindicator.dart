import 'package:flutter/material.dart';

class ProgressCircularIndicatorCustom extends StatelessWidget {
  const ProgressCircularIndicatorCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(.3),
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      child: const CircularProgressIndicator.adaptive(
        backgroundColor: Colors.teal,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
      ),
    );
  }
}
