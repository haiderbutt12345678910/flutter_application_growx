import 'package:flutter_application_growx/Features/domain/usecases/AuthUserCases/loginUseCase.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInCubit extends Cubit<BlocStates> {
  LoginUseCase logInUseCase;

  LogInCubit({required this.logInUseCase}) : super(Initial());

  Future<void> logIn(String email, String password) async {
    emit(Loading());
    logInUseCase.logIn(email, password).then((value) {
      if (value == "S") {
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
    });
  }
}
