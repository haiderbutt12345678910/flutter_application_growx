import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userplantEntity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AgentBloc/readAgentListCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/updateUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/localCubit/uerplantdataStatic.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/landingPage.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/Modules/webPlantImageContainer.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/global/header.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/progresscircularbarindicator.dart';
import 'package:flutter_application_growx/constvar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../Widgets/Modules/webPlantBtns.dart';
import 'mainpage.dart';

class WebPalntData extends StatefulWidget {
  const WebPalntData({super.key});

  @override
  State<WebPalntData> createState() => _WebPalntDataState();
}

class _WebPalntDataState extends State<WebPalntData> {
  final key = GlobalKey<FormState>();
  final plantDetailController = TextEditingController();
  final plantCatController = TextEditingController();
  final dateOfPlantationController = TextEditingController(
      text: DateFormat.yMMMMd("en_US").format(DateTime.now()).toString());

  @override
  void dispose() {
    plantCatController.dispose();
    dateOfPlantationController.dispose();
    plantDetailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Form(
            key: key,
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  TopBar(clicked: 4),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Plant Information",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.black,
                    child: BlocConsumer<UpdateUserCubit, BlocStates>(
                        builder: ((context, state) {
                      return Stack(
                        children: [
                          const BackGroundGradientContainer(),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  height: size.height,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const WebPlantImageContainer(),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TextFormField(
                                          cursorColor: Colors.white,
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Feild is Required";
                                            } else {
                                              return null;
                                            }
                                          },
                                          decoration: const InputDecoration(
                                              hintText: "Enter plant Details"),
                                          controller: plantDetailController,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TextFormField(
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Feild is Required";
                                            } else {
                                              return null;
                                            }
                                          },
                                          controller: plantCatController,
                                          decoration: const InputDecoration(
                                            hintText: "Enter Plant Category",
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: TextFormField(
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Feild is Required";
                                            } else {
                                              return null;
                                            }
                                          },
                                          controller:
                                              dateOfPlantationController,
                                          decoration: const InputDecoration(
                                            hintText: "Enter plantation Date",
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              submit(context);
                                            },
                                            child: const Text("Submit")),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Environment",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const WebPlantBtns(
                                          text: "Water Ph",
                                          id: "wp",
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const WebPlantBtns(
                                          text: "Water Temp",
                                          id: "wt",
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const WebPlantBtns(
                                          text: "Water Volume",
                                          id: "wv",
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "FEEDING",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const WebPlantBtns(
                                          text: "Temp OF",
                                          id: "t",
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const WebPlantBtns(
                                          text: "Humidity %",
                                          id: "h",
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const WebPlantBtns(
                                          text: "CO2 PPM",
                                          id: "c",
                                        ),
                                      ],
                                    )),
                              )
                            ],
                          ),
                          if (state is Loading)
                            const ProgressCircularIndicatorCustom()
                        ],
                      );
                    }), listener: (ctx, state) {
                      if (state is Sucessfull) {
                        var snackBar = const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(successsnackbartext),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebAccessPage(
                                    pageId: 0,
                                  )),
                        );
                      }

                      if (state is Failure) {
                        var snackBar = const SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text(faliuresnackbartext),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }),
                  ))
                ],
              ),
            )),
      ),
    );
  }

  void submit(BuildContext buildContext) {
    if (key.currentState!.validate()) {
      Userdataentity userdataentity = Userdataentity(
          userplantEntity: UserplantEntity(
              plantaCategory: plantCatController.text,
              plantationDate: dateOfPlantationController.text,
              tempOf: UserPlantStatic.tempOf,
              co2ppm: UserPlantStatic.co2ppm,
              humidity: UserPlantStatic.humidity,
              waterPh: UserPlantStatic.waterPh,
              waterTemp: UserPlantStatic.waterTemp,
              waterVolumne: UserPlantStatic.waterVolume,
              week: "0",
              imgUrl: ""));
      if (UserPlantStatic.plantImage == null) {
        var snackBar = const SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Select Image For Plant"),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        BlocProvider.of<UpdateUserCubit>(context)
            .updateUserData(userdataentity, null, UserPlantStatic.plantImage);
      }
    } else {
      return;
    }
  }
}
