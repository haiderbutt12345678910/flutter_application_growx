import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/AuthPages/signIn.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/AuthPages/register.dart';

import '../../../../../constvar.dart';
import '../../../widgets/backgroundgradientcontainer.dart';

class WebInitialPage extends StatelessWidget {
  const WebInitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(body: fordesktop(context, size.height, size.width)),
    );
  }

  Widget fordesktop(BuildContext context, double size, double width) {
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: width * .5,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          //signin screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WebSignIn()),
                          );
                        },
                        child: const Text(login)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            side: const BorderSide(
                                width: 2, color: Colors.white)),
                        onPressed: () {
                          //signup screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WebSignUp()),
                          );
                        },
                        child: const Text(signup)),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    ]);
  }
}
