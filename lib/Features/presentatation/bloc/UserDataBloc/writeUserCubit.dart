import 'package:flutter_application_growx/Features/domain/usecases/UserDataCrudUseCase/writeUserDataUseCase.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/UserEntities/userdataentity.dart';

class WriteUserCubit extends Cubit<BlocStates> {
  WriteUserDataUseCase writeUserDataUseCase;
  WriteUserCubit({required this.writeUserDataUseCase}) : super(Initial());

  Future<void> readUserData(Userdataentity userdataentity) async {
    emit(Loading());
    writeUserDataUseCase.createUser(userdataentity).then((value) {
      if (value == "S") {
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
    });
  }
}
