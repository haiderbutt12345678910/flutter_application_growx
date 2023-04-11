import 'package:flutter_application_growx/Features/domain/entities/vediosEntity.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/readVedioListUseCase.dart';

class RaedVedioListCubit extends Cubit<BlocStates> {
  List<VediosEntity> vedioList = [];
  ReadVedioListUseCase readVedioListUseCase;
  RaedVedioListCubit({required this.readVedioListUseCase}) : super(Initial());

  Future<void> readVedioList() async {
    emit(Loading());
    await readVedioListUseCase.readVedioList().then((value) {
      if (value.isNotEmpty) {
        vedioList = value.toList();
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
    });
  }

  List<VediosEntity> readVedioListLocall() {
    return vedioList;
  }
}
