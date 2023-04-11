import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/global/header.dart';

import '../Widgets/footer.dart';

class Features extends StatelessWidget {
  Features({super.key});
  final list = [
    [
      "Streamlined UI for easy access to every amazing feature",
      "Your GrowLog keeps track of how your plant is doing",
      "Pioneering features include live video chat with your personal GrowMaster"
    ],
    [
      "Your personalized GrowGuide shows you what to expect, week to week",
      "Our technology gives you data driven results for your best grow",
      "Access all of GrowX AI any time of day, wherever you are"
    ]
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: size.height,
          color: Colors.black,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: size.height,
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: size.height * .2,
                    ),
                    Container(
                        color: Colors.black,
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Text(
                          "What a Revolution looks like",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Text(
                          "We think everyone should try growing their own herbs and produce, but we also know not everyone lives in a place where that is possible. Not anymore: here is how else we are changing the game",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 24),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: size.height * .7,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0; i < list[0].length; i++)
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(.7),
                                        border: Border.all(color: Colors.grey)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 30),
                                    alignment: Alignment.center,
                                    child: Text(
                                      list[0][i],
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(fontSize: 30),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "Asset/webimages/leaves.png",
                                    ),
                                    fit: BoxFit.cover)),
                          )),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0; i < list[1].length; i++)
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(.2),
                                        border: Border.all(color: Colors.grey)),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 30),
                                    alignment: Alignment.center,
                                    child: Text(
                                      list[0][i],
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(fontSize: 30),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: const Footer(),
                    )
                  ]),
                ),
              ),
              TopBar(
                clicked: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
