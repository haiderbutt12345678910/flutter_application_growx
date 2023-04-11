import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AgentBloc/readAgentListCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/updateUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/Contact%20Us/Emial/createEmail.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/Contact%20Us/Emial/emailOverView.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/Contact%20Us/LiveChat/startLiveChat.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/Contact%20Us/VedioCall/OverViewScreen.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/progresscircularbarindicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsOverView extends StatefulWidget {
  const ContactUsOverView({super.key});

  @override
  State<ContactUsOverView> createState() => _ContactUsOverViewState();
}

class _ContactUsOverViewState extends State<ContactUsOverView> {
  String? id;
  File? image;
  @override
  void initState() {
    var user = BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
    if (user.agentId == null) {
      var list = BlocProvider.of<ReadAgentListCubit>(context).readListLocall();
      BlocProvider.of<ReadUserCubit>(context).userdataentity.agentId =
          list[0].id;
      BlocProvider.of<UpdateUserCubit>(context)
          .updateUserData(
              Userdataentity(
                agentId: list[0].id,
              ),
              image,
              null)
          .then((value) {});
    } else {
      id = user.agentId;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();

    print(user.agentId);
    var a = MediaQuery.of(context).size;
    return Scaffold(
      body: id == null
          ? BlocBuilder<UpdateUserCubit, BlocStates>(builder: (ctx, state) {
              return Stack(
                children: [
                  const BackGroundGradientContainer(),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Heading(
                            heading: "CUSTOMER SUPPRORT", subHeading: ""),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 25),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            onTap: () {
                              //    navigate to email
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CreateEmail()),
                              );
                            },
                            subtitle: Text(
                              "Contact Us With Email To Get Resposnse with in 24 to 48 hours",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            title: Text(
                              "EMAIL",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            leading: const Icon(
                              Icons.mail,
                              color: Colors.amber,
                              size: 40,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 25),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            onTap: () {
                              //    navigate to email
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const StartLiveChat()),
                              );
                            },
                            subtitle: Text(
                              "Our Team Is Online 24/7 for a Live Chat",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            title: Text(
                              "Live Chat",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            leading: const Icon(
                              Icons.chat,
                              color: Colors.amber,
                              size: 40,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 25),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            onTap: () {
                              //    navigate to Veiod schduling
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LiveCallOverView()),
                              );
                            },
                            subtitle: Text(
                              "Schedule a Vedio Meeting with our expert",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            title: Text(
                              "Schedule Vedio Call",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            leading: const Icon(
                              Icons.video_call_rounded,
                              color: Colors.amber,
                              size: 50,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state is Loading) const ProgressCircularIndicatorCustom()
                ],
              );
            })
          : Stack(
              children: [
                const BackGroundGradientContainer(),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Heading(
                          heading: "CUSTOMER SUPPRORT", subHeading: ""),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 25),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          onTap: () {
                            //    navigate to email
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EmailOverView()),
                            );
                          },
                          subtitle: Text(
                            "Contact Us With Email To Get Resposnse with in 24 to 48 hours",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          title: Text(
                            "EMAIL",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          leading: const Icon(
                            Icons.mail,
                            color: Colors.amber,
                            size: 40,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 25),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          onTap: () {
                            //    navigate to email
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const StartLiveChat()),
                            );
                          },
                          subtitle: Text(
                            "Our Team Is Online 24/7 for a Live Chat",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          title: Text(
                            "Live Chat",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          leading: const Icon(
                            Icons.chat,
                            color: Colors.amber,
                            size: 40,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 25),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          onTap: () {
                            //    navigate to Veiod schduling
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LiveCallOverView()),
                            );
                          },
                          subtitle: Text(
                            "Schedule a Vedio Meeting with our expert",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          title: Text(
                            "Schedule Vedio Call",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          leading: const Icon(
                            Icons.video_call_rounded,
                            color: Colors.amber,
                            size: 50,
                          ),
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
