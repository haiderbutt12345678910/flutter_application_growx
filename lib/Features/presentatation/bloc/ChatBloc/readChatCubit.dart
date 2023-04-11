import 'dart:async';

import 'package:flutter_application_growx/Features/domain/entities/chatEntity.dart';
import 'package:flutter_application_growx/Features/domain/usecases/ChatUseCase/readChatUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadChatCubit extends Cubit<List<ChatEntity>> {
  ReadChatUseCase readChatUseCase;

  StreamSubscription? _subscription;

  List<ChatEntity> chatList = [];

  ReadChatCubit({required this.readChatUseCase}) : super([]);

  Future<void> readChatList(String agentid) async {
    try {
      // Cancel any existing subscription
      _subscription?.cancel();

      // Listen to the chat collection and update state with any new messages
      _subscription = readChatUseCase.readChatList(agentid).listen((messages) {
        chatList = messages.toList();
        emit(messages.toList());
      });
    } on Exception catch (e) {
      List<ChatEntity> chatentity = [ChatEntity(massege: e.toString())];
      emit(chatentity.toList());
    }
  }

  List<ChatEntity> readdtChatListLocall() {
    return chatList;
  }

  @override
  Future<void> close() {
    // Cancel subscription when cubit is closed
    _subscription?.cancel();
    return super.close();
  }
}
