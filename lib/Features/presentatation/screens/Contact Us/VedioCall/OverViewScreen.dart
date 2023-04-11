import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/VedioCallBloc/readVedioRequestBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/Contact%20Us/VedioCall/setMetting.dart';
import 'package:flutter_application_growx/Features/presentatation/webScreensandWidgets/Screens/StartGrowing/Modules/GrowMaster/scheduleMeeting.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/progresscircularbarindicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiveCallOverView extends StatefulWidget {
  const LiveCallOverView({super.key});

  @override
  State<LiveCallOverView> createState() => _LiveCallOverViewState();
}

class _LiveCallOverViewState extends State<LiveCallOverView> {
  @override
  void initState() {
    var a = BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();

    BlocProvider.of<ReadVedioRequestBloc>(context)
        .readUserData(a.agentId as String);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.teal,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SetMeeting()),
            );
          },
          label: Text(
            "Set Meeting",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        body: Stack(
          children: [
            const BackGroundGradientContainer(),
            BlocBuilder<ReadVedioRequestBloc, BlocStates>(
                builder: (ctx, state) {
              var a = BlocProvider.of<ReadVedioRequestBloc>(context)
                  .readUserDataLocall();

              return Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    child: a.dateTime == "non" && state is! Loading
                        ? Text(
                            "N0 Meetngs yet!",
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Heading(
                                  heading: "Meeting Description",
                                  subHeading: ""),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                'Date: ${a.dateTime}',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                a.meetingpasscode == ""
                                    ? "Meeting pass Code: Pending"
                                    : 'MeetingPassCode: ${a.meetingpasscode}',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                  ),
                  if (state is Loading) const ProgressCircularIndicatorCustom()
                ],
              );
            })
          ],
        ));
  }
}
