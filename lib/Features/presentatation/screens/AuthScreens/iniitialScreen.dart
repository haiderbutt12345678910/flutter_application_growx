import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/AuthScreens/loginscreen.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/AuthScreens/signupscreen.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/constvar.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(body: forMobile(context, size.height)),
    );
  }

  Widget forMobile(BuildContext context, double size) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      const BackGroundGradientContainer(),
      Container(
        width: double.infinity,
        height: size * .3,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Asset/images/plant.png"),
                fit: BoxFit.cover)),
      ),
      Container(
        padding: const EdgeInsets.only(bottom: 30),
        alignment: Alignment.bottomCenter,
        width: double.infinity,
        height: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            height: size * .3,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Asset/webimages/whitelogo.png"),
                    fit: BoxFit.contain)),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  //signin screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LogInScreen()),
                  );
                },
                child: const Text(login)),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    side: const BorderSide(width: 2, color: Colors.white)),
                onPressed: () {
                  //signup screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()),
                  );
                },
                child: const Text(signup)),
          ),
        ]),
      ),
    ]);
  }

  Widget forMobileWeb(BuildContext context, double size) {
    return Container(
      width: double.infinity,
      height: size,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          //app bar
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: size * .14,
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset("Asset/webimages/whitelogo.png"),
                      ),
                      Expanded(
                        child: Row(
                          children: [],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget forDestopWeb(BuildContext context, double size) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
    );
  }
}
