import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/chatEntity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/ChatBloc/readChatCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/backgroundgradientcontainer.dart';
import 'package:flutter_application_growx/Features/presentatation/widgets/gloablwidgets/writeMassege.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({super.key});

  @override
  State<LiveChatScreen> createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  final scrollController = ScrollController();
  @override
  void initState() {
    var a = BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
    BlocProvider.of<ReadChatCubit>(context).readChatList(a.agentId as String);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var user = BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
    var senderid = user.uid;
    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const BackGroundGradientContainer(),
        BlocBuilder<ReadChatCubit, List<ChatEntity>>(builder: (ctx, state) {
          if (scrollController.hasClients) {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }

          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              if (state.isEmpty)
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      "Start Chat",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 70, top: 10),
                width: double.infinity,
                height: size.height,
                child: ListView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    scrollDirection: Axis.vertical,
                    itemCount: state.length,
                    itemBuilder: (ctx, index) {
                      return BubbleSpecialThree(
                        delivered: true,
                        isSender:
                            senderid == state[index].senderId ? false : true,
                        text: state[index].massege as String,
                        color: senderid == state[index].senderId
                            ? Colors.teal
                            : Colors.grey,
                        tail: true,
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      );
                    }),
              ),
            ],
          );
        }),
        const WriteMassege()
      ],
    ));
  }
}
