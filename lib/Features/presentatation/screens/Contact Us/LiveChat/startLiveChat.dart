import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/chatOverViewEntity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/ChatBloc/readChatCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/ChatBloc/updateChatOverViewCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_application_growx/Features/presentatation/screens/Contact%20Us/LiveChat/LiveChatScreen.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/heading.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/progresscircularbarindicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartLiveChat extends StatefulWidget {
  const StartLiveChat({super.key});

  @override
  State<StartLiveChat> createState() => _StartLiveChatState();
}

class _StartLiveChatState extends State<StartLiveChat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          const BackGroundGradientContainer(),
          BlocConsumer<UpdateChatOverViewCubit, BlocStates>(
              builder: (ctx, state) {
            return Stack(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Heading(
                          heading: "CONNECT TO OUR SUPPORT TEAM NOW",
                          subHeading: "LIVE CHAT"),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              submit(context);
                            },
                            child: const Text("Start Live Chat")),
                      )
                    ],
                  ),
                ),
                if (state is Loading) const ProgressCircularIndicatorCustom()
              ],
            );
          }, listener: (ctx, state) {
            if (state is Sucessfull) {
              var snackBar = const SnackBar(
                duration: Duration(seconds: 1),
                content: Text("Succefully Connected"),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LiveChatScreen()),
              );
            }

            if (state is Failure) {
              var snackBar = const SnackBar(
                duration: Duration(seconds: 2),
                content: Text("SomeThing Went Wrong Try Again Later"),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          })
        ],
      )),
    );
  }

  void submit(BuildContext context) {
    var user = BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
    ChatOverViewEntity chatEntity = ChatOverViewEntity(
      imgUrl: user.imageUrl,
      userName: user.name,
    );
    BlocProvider.of<UpdateChatOverViewCubit>(context)
        .updateChatOverView(user.agentId as String, chatEntity);
  }
}
