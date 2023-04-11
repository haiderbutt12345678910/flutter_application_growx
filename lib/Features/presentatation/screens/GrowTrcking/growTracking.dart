import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/readVedioListBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/UserEntities/userdataentity.dart';
import '../../bloc/UserDataBloc/readUserCubit.dart';
import '../../widgets/GrowLOG/vedioPlayer.dart';
import '../../widgets/backgroundgradientcontainer.dart';
import '../../widgets/gloablwidgets/heading.dart';

class GrowTracking extends StatefulWidget {
  const GrowTracking({super.key});

  @override
  State<GrowTracking> createState() => _GrowTrackingState();
}

class _GrowTrackingState extends State<GrowTracking> {
  late Userdataentity userdataentity;
  int selectedbtn = 0;
  int showSample = 0;
  int currentindex = 0;
  @override
  void initState() {
    userdataentity =
        BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var list =
        BlocProvider.of<RaedVedioListCubit>(context).readVedioListLocall();
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const BackGroundGradientContainer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Heading(heading: "Grow Tracking", subHeading: ""),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(40, 40),
                                  textStyle:
                                      Theme.of(context).textTheme.displaySmall,
                                  backgroundColor: selectedbtn == 0
                                      ? Colors.amber
                                      : Colors.black,
                                  side: const BorderSide(
                                      width: 2, color: Colors.white)),
                              onPressed: () {
                                setState(() {
                                  selectedbtn = 0;
                                });
                              },
                              child: FittedBox(
                                child: Text("Plant Care",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall),
                              )),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(40, 40),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  textStyle:
                                      Theme.of(context).textTheme.displaySmall,
                                  backgroundColor: selectedbtn == 1
                                      ? Colors.amber
                                      : Colors.black,
                                  side: const BorderSide(
                                      width: 2, color: Colors.white)),
                              onPressed: () {
                                setState(() {
                                  selectedbtn = 1;
                                });
                              },
                              child: FittedBox(
                                  child: Text("Technology Care",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall))),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(40, 40),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  backgroundColor: selectedbtn == 2
                                      ? Colors.amber
                                      : Colors.black,
                                  side: const BorderSide(
                                      width: 2, color: Colors.white)),
                              onPressed: () {
                                setState(() {
                                  selectedbtn = 2;
                                });
                              },
                              child: FittedBox(
                                child: Text(
                                    "Scheduling For Plant\n and Technology Care",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(fontSize: 12)),
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 200,
                    width: size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return InkWell(
                            onTap: () {
                              if (currentindex != index) {
                                setState(() {
                                  currentindex = index;
                                });
                              } else {
                                return;
                              }
                            },
                            child: SizedBox(
                              width: 100,
                              child: Card(
                                color: index == currentindex
                                    ? Colors.teal
                                    : Colors.grey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      index < 9
                                          ? 'Week\n0${index + 1}'
                                          : 'Week\n${index + 1}',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const Heading(heading: "VedioTitle", subHeading: ""),
                  SizedBox(
                    width: double.infinity,
                    child: VedioPlayer(
                      vedioid: list[currentindex].vedioids![0],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
