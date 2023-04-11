import 'package:flutter_application_growx/Features/domain/entities/chatEntity.dart';
import 'package:flutter_application_growx/Features/domain/usecases/ChatUseCase/writeChatUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocstate.dart';

class WriteChatCubit extends Cubit<BlocStates> {
  WriteChatUseCase writechatUseCase;

  WriteChatCubit({required this.writechatUseCase}) : super(Initial());

  Future<void> writeChat(ChatEntity chatEntity, String agentId) async {
    emit(Loading());
    await writechatUseCase.writeChatMassege(chatEntity, agentId).then((value) {
      if (value == "S") {
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
    });
  }
}
