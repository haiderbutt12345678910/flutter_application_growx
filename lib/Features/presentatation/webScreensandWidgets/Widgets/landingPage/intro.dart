import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/AuthPages/signIn.dart';

class LandingPageIntroWidget extends StatelessWidget {
  const LandingPageIntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var a = MediaQuery.of(context).size;
    return desktopView(context, a.width, a.height);
  }

  Widget desktopView(BuildContext context, double a, double height) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 20, bottom: 2, top: 160),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "OUR TECHNOLOGY Is\n Changing The Game",
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 44),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Growing Made Easy And Efficient No Matter Your Experince",
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontFamily: 'RailWay', fontSize: 34),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40)),
                                onPressed: () {},
                                child: Text(
                                  "Download App",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontSize: 24),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 40),
                                  backgroundColor: Colors.black,
                                  side: const BorderSide(
                                      width: 2, color: Colors.teal),
                                ),
                                onPressed: () {
                                  //signup screen
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const WebSignIn()));
                                },
                                child: Text(
                                  "Sign In",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontSize: 24),
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: height,
              alignment: Alignment.bottomRight,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage("Asset/webimages/introbg.png"),
                      fit: BoxFit.fitWidth)),
            ),
          ),
        ],
      ),
    );
  }

  //944.4444580078125
}
