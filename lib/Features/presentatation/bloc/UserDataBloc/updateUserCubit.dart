import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';
import 'package:flutter_application_growx/Features/domain/usecases/UserDataCrudUseCase/updateUserDataUseCase.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateUserCubit extends Cubit<BlocStates> {
  UpdateUserDataUseCase updateUserDataUseCase;
  UpdateUserCubit({required this.updateUserDataUseCase}) : super(Initial());

  Future<void> updateUserData(
      Userdataentity userdataentity, File? image, Uint8List? uint8list) async {
    emit(Loading());
    updateUserDataUseCase
        .updateUser(userdataentity, image, uint8list)
        .then((value) {
      if (value == "S") {
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
    });
  }
}
