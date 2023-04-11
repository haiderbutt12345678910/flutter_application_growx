import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/global/header.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/landingPage/intro.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/landingPage/staff.dart';

import '../Widgets/landingPage/moudles.dart';

class LandigPage extends StatelessWidget {
  const LandigPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: size.height,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: size.height,
                      width: double.infinity,
                      color: Colors.black,
                      child: Column(
                        children: const [
                          Expanded(child: LandingPageIntroWidget())
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: .4,
                    ),
                    Container(
                        width: double.infinity,
                        color: Colors.black,
                        height: size.height,
                        child: const Modules(
                          url: "Asset/webimages/growlog.png",
                          heading: "Grow Log",
                          subHeading:
                              "Grow like a pro with our scientific approach to tracking your harvest",
                          bg: "01",
                        )),
                    Container(
                        width: double.infinity,
                        color: Colors.black,
                        height: size.height,
                        child: const Modules(
                          url: "Asset/webimages/growtracking.png",
                          heading: "Grow Tracking",
                          subHeading:
                              "Live your plant exactly what it needs with personalized weekly guides",
                          bg: "02",
                        )),
                    Container(
                        width: double.infinity,
                        color: Colors.black,
                        height: size.height,
                        child: const Modules(
                          url: "Asset/webimages/growmaster.png",
                          heading: "Grow Master",
                          subHeading:
                              "Expert advice is a tap away any time of day.Get Conncted With Our Support Team",
                          bg: "03",
                        )),
                    Container(
                        width: double.infinity,
                        color: Colors.black,
                        height: size.height,
                        child: Staff()),
                  ],
                ),
              ),
            ),
            TopBar(clicked: 0),
          ],
        ),
      ),
    );
  }
}
