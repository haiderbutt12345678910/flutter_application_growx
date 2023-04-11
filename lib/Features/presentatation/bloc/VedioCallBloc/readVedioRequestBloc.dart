import 'package:flutter_application_growx/Features/domain/entities/UserEntities/vedioRequestEntity.dart';
import 'package:flutter_application_growx/Features/domain/usecases/VedioCallUseCaese/readVedioRequestUseCase.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/UserEntities/vedioRequestEntity.dart';
import '../../../domain/entities/UserEntities/vedioRequestEntity.dart';

class ReadVedioRequestBloc extends Cubit<BlocStates> {
  VedioRequestEntity vedioRequestEntity = VedioRequestEntity(dateTime: "non");
  ReadVedioRequestUseCase readVedioRequestUseCase;
  ReadVedioRequestBloc({required this.readVedioRequestUseCase})
      : super(Initial());

  Future<void> readUserData(String agentid) async {
    emit(Loading());
    await readVedioRequestUseCase.readVedioRequesr(agentid).then((value) {
      if (value.dateTime != "non") {
        vedioRequestEntity = value;
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
    });
  }

  VedioRequestEntity readUserDataLocall() {
    return vedioRequestEntity;
  }
}
