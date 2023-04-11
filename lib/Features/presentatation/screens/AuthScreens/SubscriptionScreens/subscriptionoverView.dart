import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/homeScreen.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/subscriptioncards.dart';
import 'package:flutter_application_growx/constvar.dart';

import '../../profile.dart';

class SubsCriptionOverViewScreen extends StatelessWidget {
  const SubsCriptionOverViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var a = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: 0,
            onTap: (index) {
              if (index == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage(
                              id: 2,
                            )));
              }
            },
            items: [
              BottomNavigationBarItem(
                label: "",
                icon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: a.width / 2,
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      "Asset/images/Home.png",
                    ),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.centerRight,
                  width: a.width / 2,
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset("Asset/images/Profile.png")),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              const BackGroundGradientContainer(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      height: a.height * .2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            width: double.infinity,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 40,
                                )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: double.infinity,
                            child: Text(
                              plansHeading,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Expanded(child: SubscriptionCard()),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
