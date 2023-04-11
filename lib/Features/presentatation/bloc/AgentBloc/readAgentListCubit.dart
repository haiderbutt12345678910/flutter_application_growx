import 'package:flutter_application_growx/Features/domain/entities/AgentEntity.dart';
import 'package:flutter_application_growx/Features/domain/usecases/AgentUseCase/readAgentUseCase.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadAgentListCubit extends Cubit<BlocStates> {
  ReadAgentUseCase readAgentUseCase;
  List<AgentEntity> agentList = [];

  ReadAgentListCubit({required this.readAgentUseCase}) : super(Initial());

  Future<void> readAgnets() async {
    // emit(Loading());
    await readAgentUseCase.readAgentList().then((value) {
      if (value.isNotEmpty) {
        agentList = value.toList();
        // emit(Sucessfull());
      } else {}
    });
  }

  List<AgentEntity> readListLocall() {
    return agentList;
  }
}
