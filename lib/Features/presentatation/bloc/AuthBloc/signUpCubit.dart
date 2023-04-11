import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';
import 'package:flutter_application_growx/Features/domain/usecases/AuthUserCases/signUpUseCase.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<BlocStates> {
  SignUpUseCase signUpUseCase;

  SignUpCubit({required this.signUpUseCase}) : super(Initial());

  Future<void> signUp(
      String email,
      String password,
      String agentId,
      String userCount,
      Userdataentity userdataentity,
      File? image,
      Uint8List? uint8list) async {
    emit(Loading());

    signUpUseCase
        .signup(email, password, agentId, userCount, userdataentity, image,
            uint8list)
        .then((value) {
      if (value == "S") {
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
    });
  }
}
