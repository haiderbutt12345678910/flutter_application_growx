import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/readVedioListBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/GrowLOG/vedioPlayer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class GrowLog extends StatefulWidget {
  const GrowLog({super.key});

  @override
  State<GrowLog> createState() => _GrowLogState();
}

class _GrowLogState extends State<GrowLog> {
  late Userdataentity userdataentity;
  int currentindex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  final key = GlobalKey<FormState>();
  @override
  void initState() {
    userdataentity =
        BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return showGrowLog(context, size);
  }

  Widget showGrowLog(BuildContext buildContext, Size size) {
    var list =
        BlocProvider.of<RaedVedioListCubit>(context).readVedioListLocall();

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const BackGroundGradientContainer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Heading(heading: "GROWLOG", subHeading: ""),
                SizedBox(
                  height: 200,
                  width: size.width,
                  child: ListView.builder(
                      itemCount: list.length,
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
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
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
          )
        ],
      ),
    );
  }
}
