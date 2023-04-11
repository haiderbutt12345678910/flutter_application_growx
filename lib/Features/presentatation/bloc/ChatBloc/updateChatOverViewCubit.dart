import 'package:flutter_application_growx/Features/domain/usecases/ChatUseCase/updateChatOverViewUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/chatOverViewEntity.dart';
import '../blocstate.dart';

class UpdateChatOverViewCubit extends Cubit<BlocStates> {
  UpdateChatOverViewUseCase updateChatOverViewUseCase;

  UpdateChatOverViewCubit({required this.updateChatOverViewUseCase})
      : super(Initial());

  Future<void> updateChatOverView(
      String agentId, ChatOverViewEntity chatOverViewEntity) async {
    emit(Loading());
    updateChatOverViewUseCase
        .requestLiveChat(agentId, chatOverViewEntity)
        .then((value) {
      if (value == "S") {
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
    });
  }
}
