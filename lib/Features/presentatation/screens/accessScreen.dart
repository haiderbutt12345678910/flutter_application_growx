import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/AuthScreens/SubscriptionScreens/subscriptionoverView.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/Contact%20Us/contactUsOverview.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/GrowTrcking/growTracking.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/homeScreen.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'GrowLog/growLog.dart';

class AccessScreen extends StatefulWidget {
  const AccessScreen({super.key});

  @override
  State<AccessScreen> createState() => _AccessScreenState();
}

class _AccessScreenState extends State<AccessScreen> {
  List<Widget> list = [
    const HomeScreen(),
    const GrowLog(),
    const GrowTracking(),
    const ContactUsOverView(),
    Container()
  ];
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    var a = BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: SizedBox(
            height: 70,
            child: BottomNavigationBar(
              backgroundColor: Colors.black.withOpacity(.9),
              currentIndex: currentIndex,
              onTap: (index) {
                if (index == 0) {
                  Navigator.of(context).pop();
                } else {
                  if (a.userSubscripsCritionEntity!.id != null) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SubsCriptionOverViewScreen()));
                  } else {
                    if (index == 1) {
                      setState(() {
                        currentIndex = index;
                      });
                    } else if (index == 2) {
                      if (a.userSubscripsCritionEntity!.id == "S" ||
                          a.userSubscripsCritionEntity!.id == "P") {
                        setState(() {
                          currentIndex = index;
                        });
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SubsCriptionOverViewScreen()));
                      }
                    } else if (index == 3) {
                      if (a.userSubscripsCritionEntity!.id == "P") {
                        setState(() {
                          currentIndex = index;
                        });
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SubsCriptionOverViewScreen()));
                      }
                    }
                  }
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      "Asset/images/Home.png",
                    ),
                  ),
                  label: '',
                ),

                //                           Asset/images/Growtrack.png
// Asset/images/Growmaster.png

// Asset/images/Growtrack.png
                BottomNavigationBarItem(
                  icon: SizedBox(
                      width: 40,
                      height: 40,
                      child: a.userSubscripsCritionEntity!.id == null
                          ? Image.asset(" Asset/images/Growtrack.png")
                          : Image.asset(
                              "Asset/images/Growlog color.png",
                            )),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                      width: 40,
                      height: 40,
                      child: a.userSubscripsCritionEntity!.id == "S" ||
                              a.userSubscripsCritionEntity!.id == "P"
                          ? Image.asset("Asset/images/GrowTrack Color.png")
                          : Image.asset(
                              "Asset/images/Growtrack.png",
                            )),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 40,
                    width: 40,
                    child: a.userSubscripsCritionEntity!.id == "P"
                        ? Image.asset(
                            "Asset/images/GrowMaster Color.png",
                          )
                        : Image.asset(
                            "Asset/images/Growmaster.png",
                          ),
                  ),
                  label: '',
                ),
              ],
            ),
          ),
          body: list[currentIndex]),
    );
  }
}
