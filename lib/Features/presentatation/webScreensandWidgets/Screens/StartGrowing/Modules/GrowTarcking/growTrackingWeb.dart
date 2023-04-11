import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/GrowLOG/vedioPlayer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bloc/readVedioListBloc.dart';
import '../../../../Widgets/footer.dart';

class WebGrowTracking extends StatefulWidget {
  const WebGrowTracking({super.key});

  @override
  State<WebGrowTracking> createState() => _WebGrowTrackingState();
}

class _WebGrowTrackingState extends State<WebGrowTracking> {
  final scrollController = ScrollController();
  int selectedbtn = 0;
  late Userdataentity userdataentity;
  int currentindex = 0;

  @override
  void dispose() {
    scrollController.dispose();
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

    return showWebGrowTracking(context, size);
  }

  Widget showWebGrowTracking(BuildContext buildContext, Size size) {
    var list =
        BlocProvider.of<RaedVedioListCubit>(context).readVedioListLocall();
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
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
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                              onPressed: () {
                                scrollController.animateTo(
                                  scrollController.offset -
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
                                controller: scrollController,
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
                                scrollController.animateTo(
                                  scrollController.offset +
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
      ),
    );
  }
}
