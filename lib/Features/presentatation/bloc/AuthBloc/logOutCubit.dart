import 'package:flutter_application_growx/Features/domain/usecases/AuthUserCases/logOutUseCase.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogOutCubit extends Cubit<BlocStates> {
  LogOutUseCase logOutUseCase;

  LogOutCubit({required this.logOutUseCase}) : super(Initial());

  Future<void> logOut() async {
    emit(Loading());
    logOutUseCase.logOut().then((value) {
      if (value == "S") {
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
    });
  }
}
