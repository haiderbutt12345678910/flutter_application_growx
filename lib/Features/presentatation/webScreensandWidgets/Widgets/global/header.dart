import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AuthBloc/isUserLoggedInCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/AuthPages/register.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/AuthPages/signIn.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/StartGrowing/mainpage.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/StartGrowing/plantdata.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/features.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/howItWorks.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/landingPage.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/pricing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopBar extends StatelessWidget {
  final int clicked;
  final list = ["Home", "How It Works", "Feature", "Pricing", "Start Growing"];

  TopBar({super.key, required this.clicked});

  @override
  Widget build(BuildContext context) {
    Userdataentity user =
        BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
    var a = MediaQuery.of(context).size;
    var fontSize = MediaQuery.of(context).textScaleFactor;
    return fordeskop(context, a.height, fontSize, user);
  }

  Widget fordeskop(BuildContext context, double height, double width,
      Userdataentity userData) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: height * .15,
      decoration: const BoxDecoration(
          color: Colors.black,
          border: Border(bottom: BorderSide(color: Colors.white, width: 1))),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      "Asset/webimages/whitelogo.png",
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Expanded(
                        flex: 0,
                        child: TextButton(
                            onPressed: () {
                              if (clicked != i) {
                                if (i == 0) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LandigPage()),
                                  );
                                } else if (i == 1) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HowItWorks()),
                                  );
                                } else if (i == 2) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Features()),
                                  );
                                } else if (i == 3) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Pricing()),
                                  );
                                } else if (i == 4) {
                                  var isLoggedIn =
                                      BlocProvider.of<IsUserLoggedInCubit>(
                                              context)
                                          .isUserLoggedInLocall();
                                  if (isLoggedIn) {
                                    var q =
                                        BlocProvider.of<ReadUserCubit>(context)
                                            .readUserDataLocall();
                                    if (q.userplantEntity!.co2ppm == null) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const WebPalntData()),
                                      );
                                    } else {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => WebAccessPage(
                                                  pageId: 0,
                                                )),
                                      );
                                    }
                                  } else {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const WebSignIn()),
                                    );
                                  }
                                } else if (i == 5) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const WebSignUp()),
                                  );
                                }
                              } else {
                                return;
                              }
                            },
                            child: Text(
                              list[i],
                              //0095
                              textAlign: TextAlign.center,

                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 21,
                                      color: clicked == i
                                          ? Colors.amber
                                          : Colors.white),
                            )),
                      ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 0,
                      child: SizedBox(
                        width: 250,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 25, horizontal: 10)),
                            onPressed: () {},
                            child: Text(
                              "Download App",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 16),
                            )),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          //   Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => const HomeScreen()),
                          // );
                        },
                        icon: Icon(
                          Icons.person,
                          color: clicked == 5 ? Colors.amber : Colors.white,
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
