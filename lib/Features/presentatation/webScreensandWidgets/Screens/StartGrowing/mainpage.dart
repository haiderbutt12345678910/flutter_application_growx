import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/StartGrowing/Modules/GrowLog/growLog.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/StartGrowing/Modules/GrowTarcking/growTrackingWeb.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/pricing.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/global/header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Modules/GrowMaster/growMasterWeb.dart';

class WebAccessPage extends StatefulWidget {
  int pageId;
  WebAccessPage({super.key, required this.pageId});

  @override
  State<WebAccessPage> createState() => _WebAccessPageState();
}

class _WebAccessPageState extends State<WebAccessPage> {
  int moduleid = 0;
  String moduleName = "Grow Log";
  @override
  void initState() {
    moduleid = widget.pageId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var a = BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
    if (a.userSubscripsCritionEntity!.id == null) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Pricing()),
        );
      });
    }

    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Column(children: [
              TopBar(clicked: 4),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      width: size.width * .5,
                      alignment: Alignment.centerRight,
                      child: Text(
                        moduleName,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(right: 30),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        width: size.width * .5,
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                if (a.userSubscripsCritionEntity!.id == null) {
                                  var snackBar = const SnackBar(
                                    duration: Duration(seconds: 3),
                                    content: Text("Subcribe to Get Started"),
                                    backgroundColor: Colors.red,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  return;
                                }

                                if (moduleid == 0) {
                                  return;
                                } else {
                                  moduleid = 0;
                                  setState(() {
                                    moduleName = "Grow Log";
                                  });
                                }
                              },
                              child: a.userSubscripsCritionEntity!.id != null
                                  ? SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Image.asset(
                                        "Asset/images/Growlog color.png",
                                      ))
                                  : SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Image.asset(
                                        "Asset/images/Growlog.png",
                                      )),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            InkWell(
                                onTap: () {
                                  if (a.userSubscripsCritionEntity!.id ==
                                      null) {
                                    var snackBar = const SnackBar(
                                      duration: Duration(seconds: 3),
                                      content: Text("Subcribe to Get Started"),
                                      backgroundColor: Colors.red,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    return;
                                  } else {
                                    if (a.userSubscripsCritionEntity!.id ==
                                            "S" ||
                                        a.userSubscripsCritionEntity!.id ==
                                            "P") {
                                      if (moduleid == 1) {
                                        return;
                                      } else {
                                        setState(() {
                                          moduleid = 1;
                                          moduleName = "Grow Tracking";
                                        });
                                      }
                                    }
                                  }
                                },
                                child: a.userSubscripsCritionEntity!.id ==
                                            "S" ||
                                        a.userSubscripsCritionEntity!.id == "P"
                                    ? SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Image.asset(
                                          "Asset/images/GrowTrack Color.png",
                                        ))
                                    : SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: Image.asset(
                                          "Asset/images/Growtrack.png",
                                        ))),
                            const SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              onTap: () {
                                if (a.userSubscripsCritionEntity == null) {
                                  var snackBar = const SnackBar(
                                    duration: Duration(seconds: 3),
                                    content: Text("Subcribe to Get Started"),
                                    backgroundColor: Colors.red,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  return;
                                } else {
                                  if (a.userSubscripsCritionEntity!.id == "P") {
                                    if (moduleid == 2) {
                                      return;
                                    } else {
                                      moduleid = 2;
                                      setState(() {
                                        moduleName = "Grow Mater";
                                      });
                                    }
                                  } else {
                                    var snackBar = const SnackBar(
                                      duration: Duration(seconds: 3),
                                      content: Text("Subcribe to Get Started"),
                                      backgroundColor: Colors.red,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                }
                              },
                              child: a.userSubscripsCritionEntity!.id == "P"
                                  ? SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Image.asset(
                                        "Asset/images/GrowMaster Color.png",
                                      ))
                                  : SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Image.asset(
                                        "Asset/images/Growmaster.png",
                                      )),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (moduleid == 0) const Expanded(child: WebGrowLog()),
              if (moduleid == 1) const Expanded(child: WebGrowTracking()),
              if (moduleid == 2) const Expanded(child: GrowMasterWeb()),
            ]),
          ],
        ),
      )),
    );
  }
}
