import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/accessScreen.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/homeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/UserEntities/userplantEntity.dart';
import '../bloc/UserDataBloc/readUserCubit.dart';
import '../bloc/UserDataBloc/updateUserCubit.dart';
import '../bloc/blocstate.dart';
import '../bloc/localCubit/uerplantdataStatic.dart';
import '../widgets/GrowLOG/btnrow.dart';
import '../widgets/GrowLOG/plantImageContainer.dart';
import '../widgets/backgroundgradientcontainer.dart';
import '../widgets/gloablwidgets/heading.dart';
import '../widgets/gloablwidgets/progresscircularbarindicator.dart';

class PlantInfo extends StatefulWidget {
  final int id;
  const PlantInfo({super.key, required this.id});

  @override
  State<PlantInfo> createState() => _PlantInfoState();
}

class _PlantInfoState extends State<PlantInfo> {
  final plantcat = TextEditingController();
  final plantDate = TextEditingController(
      text: DateFormat.yMMMMd("en_US").format(DateTime.now()).toString());
  final key = GlobalKey<FormState>();
  @override
  void dispose() {
    plantcat.dispose();
    plantDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: showForm(context, size),
      ),
    );
  }

  Widget showForm(BuildContext context, Size size) {
    return Form(
        key: key,
        child: BlocConsumer<UpdateUserCubit, BlocStates>(builder: (ctx, state) {
          return Stack(
            children: [
              const BackGroundGradientContainer(),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                height: size.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Heading(
                          heading: "Complete The Form",
                          subHeading: "For Plant"),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        child: TextFormField(
                          controller: plantcat,
                          decoration: const InputDecoration(
                              hintText: "Enter Palnt Catergory"),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Fill FEILD";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        child: TextFormField(
                          controller: plantDate,
                          decoration: const InputDecoration(
                              labelText: "Plantationdate",
                              hintText: "Enter Palntation date"),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Fill FEILD";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Heading(heading: 'Environment', subHeading: ""),
                      const SizedBox(
                        height: 20,
                      ),
                      const BtnRow(
                        text: "Water Ph",
                        id: "wp",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const BtnRow(
                        text: "Water Temp",
                        id: "wt",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const BtnRow(
                        text: "Water Volume",
                        id: "wv",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Heading(heading: 'Feeding', subHeading: ""),
                      const SizedBox(
                        height: 20,
                      ),
                      const BtnRow(
                        text: "Temp OF",
                        id: "t",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const BtnRow(
                        text: "Humidity %",
                        id: "h",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const BtnRow(
                        text: "CO2 PPM",
                        id: "c",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const PlantContainerImage(),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
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
              if (state is Loading) const ProgressCircularIndicatorCustom()
            ],
          );
        }, listener: ((context, state) {
          if (state is Sucessfull) {
            UserplantEntity? userplant = UserplantEntity(
                waterPh: UserPlantStatic.waterPh,
                tempOf: UserPlantStatic.tempOf,
                co2ppm: UserPlantStatic.co2ppm,
                humidity: UserPlantStatic.humidity,
                waterTemp: UserPlantStatic.waterTemp,
                waterVolumne: UserPlantStatic.waterVolume,
                week: "0",
                plantationDate: plantDate.text,
                plantaCategory: plantcat.text);

            BlocProvider.of<ReadUserCubit>(context)
                .readUserDataLocall()
                .userplantEntity = userplant;
            if (widget.id == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AccessScreen()),
              );
            }
          }
          if (state is Failure) {
            var snackBar = const SnackBar(
              duration: Duration(seconds: 1),
              content: Text("SomeTing Wnet Wrong!Try Again"),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        })));
  }

  void submit(BuildContext context) {
    var a = key.currentState!.validate();

    if (a) {
      // DateTime noew = DateTime.now();
      // String weekday = DateFormat('E').format(noew);

      Userdataentity? userDataEntity = Userdataentity(
          userplantEntity: UserplantEntity(
              waterPh: UserPlantStatic.waterPh,
              tempOf: UserPlantStatic.tempOf,
              co2ppm: UserPlantStatic.co2ppm,
              humidity: UserPlantStatic.humidity,
              waterTemp: UserPlantStatic.waterTemp,
              waterVolumne: UserPlantStatic.waterVolume,
              week: "0",
              plantationDate: plantDate.text,
              plantaCategory: plantcat.text));
      if (UserPlantStatic.plantImgMbl != null) {
        BlocProvider.of<UpdateUserCubit>(context)
            .updateUserData(userDataEntity, UserPlantStatic.plantImgMbl, null);
      } else {
        var snackBar = const SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Plaese Insert Image"),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      return;
    }
  }
}
