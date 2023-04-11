import 'package:flutter_application_growx/Features/domain/entities/UserEntities/userdataentity.dart';
import 'package:flutter_application_growx/Features/domain/usecases/UserDataCrudUseCase/readUserDataUseCase.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadUserCubit extends Cubit<BlocStates> {
  Userdataentity userdataentity = Userdataentity();
  ReadUserDataUseCase readUserDataUseCase;
  ReadUserCubit({required this.readUserDataUseCase}) : super(Initial());

  Future<void> readUserData() async {
    emit(Loading());
    await readUserDataUseCase.readUser().then((value) {
      if (value.uid != null) {
        userdataentity = value;
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
      print(userdataentity.uid);
    });
  }

  Userdataentity readUserDataLocall() {
    return userdataentity;
  }
}
