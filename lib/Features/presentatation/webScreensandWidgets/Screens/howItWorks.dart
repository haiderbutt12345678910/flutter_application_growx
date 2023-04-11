import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/footer.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/global/header.dart';

class HowItWorks extends StatelessWidget {
  HowItWorks({super.key});
  final list = [
    [
      "01",
      "Upload photos of your plant so your GrowMaster sees exactly what you see"
    ],
    [
      "02",
      "Track every element of your grow, from seed down to the type of nutrients"
    ],
    [
      "03",
      "24/7 access to detailed “What to Expect” guides so you are never lost"
    ],
    ["04", "Step by step support, for the app or your GrowKit"]
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(body: forDestop(context, size.height)));
  }

  Widget forDestop(BuildContext context, double height) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
          width: double.infinity,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * .2,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  width: double.infinity,
                  height: height * .72,
                  color: Colors.black,
                  child: Row(
                    children: [
                      for (int i = 0; i < list.length; i++)
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80, vertical: 80),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.amber),
                                  ),
                                  child: Text(
                                    list[i][0],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            color: Colors.amber, fontSize: 30),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  list[i][1],
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(fontSize: 28),
                                )
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: const Footer(),
                )
              ],
            ),
          ),
        ),
        TopBar(clicked: 1),
      ],
    );
  }
}
