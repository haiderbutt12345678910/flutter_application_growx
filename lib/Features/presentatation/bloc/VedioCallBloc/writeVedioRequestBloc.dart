import 'package:flutter_application_growx/Features/domain/entities/UserEntities/vedioRequestEntity.dart';
import 'package:flutter_application_growx/Features/domain/usecases/VedioCallUseCaese/writevVedioRequestUseCase.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WriteVedioRequestBloc extends Cubit<BlocStates> {
  WritevVedioRequestUseCase writevVedioRequestUseCase;
  WriteVedioRequestBloc({required this.writevVedioRequestUseCase})
      : super(Initial());

  Future<void> writeVedioRequesr(
      VedioRequestEntity vedioRequestEntity, String id) async {
    emit(Loading());
    writevVedioRequestUseCase
        .writeVedioRequesr(vedioRequestEntity, id)
        .then((value) {
      if (value == "S") {
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
    });
  }
}
