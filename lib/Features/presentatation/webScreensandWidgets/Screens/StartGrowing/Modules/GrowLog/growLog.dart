import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/readVedioListBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Widgets/footer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/GrowLOG/vedioPlayer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class WebGrowLog extends StatefulWidget {
  const WebGrowLog({super.key});

  @override
  State<WebGrowLog> createState() => _WebGrowLogState();
}

class _WebGrowLogState extends State<WebGrowLog> {
  int currentindex = 0;
  late Userdataentity userdataentity;
  final scrollContoller = ScrollController();
  @override
  void dispose() {
    scrollContoller.dispose();
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

    return showWebGrowLog(context, size);
  }

  Widget showWebGrowLog(BuildContext buildContext, Size size) {
    var list =
        BlocProvider.of<RaedVedioListCubit>(context).readVedioListLocall();

    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: IconButton(
                            onPressed: () {
                              scrollContoller.animateTo(
                                scrollContoller.offset -
                                    300, // adjust this value to set the amount to scroll
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 50,
                              color: Colors.white,
                            )),
                      ),
                      Expanded(
                        flex: 10,
                        child: SizedBox(
                          height: 200,
                          child: ListView.builder(
                              controller: scrollContoller,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            index < 9
                                                ? 'Week\n0${index + 1}'
                                                : 'Week\n${index + 1}',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                            onPressed: () {
                              scrollContoller.animateTo(
                                scrollContoller.offset +
                                    300, // adjust this value to set the amount to scroll
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              size: 50,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Heading(heading: "VedioTitle", subHeading: ""),
                SizedBox(
                  height: size.height,
                  width: double.infinity,
                  child: VedioPlayer(
                    vedioid: list[currentindex].vedioids![0],
                  ),
                ),
                Container(
                  height: size.height * .5,
                  color: Colors.white,
                  width: double.infinity,
                  child: const Footer(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
