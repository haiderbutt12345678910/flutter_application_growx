import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_growx/Features/domain/entities/chatEntity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/ChatBloc/writeChatCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WriteMassege extends StatelessWidget {
  const WriteMassege({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WriteChatCubit, BlocStates>(builder: (ctx, state) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: MessageBar(
          messageBarColor: Colors.grey,
          sendButtonColor: Colors.black,
          onSend: (val) {
            if (val.isEmpty) {
              return;
            }
            var userData =
                BlocProvider.of<ReadUserCubit>(context).readUserDataLocall();
            DateTime time = DateTime.now();
            String cretedAt = time.toUtc().toString();
            ChatEntity chatEntity = ChatEntity(
                senderId: userData.agentId, createdAt: cretedAt, massege: val);

            BlocProvider.of<WriteChatCubit>(context)
                .writeChat(chatEntity, userData.agentId as String);
          },
        ),
      );
    });
  }
}
