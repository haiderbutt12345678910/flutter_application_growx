import 'package:flutter_application_growx/Features/domain/usecases/AuthUserCases/isUserLoggedInUseCase.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IsUserLoggedInCubit extends Cubit<BlocStates> {
  IsUserLoggedInUseCase isUserLoggedInUseCase;
  bool isUserSignedIn = false;

  IsUserLoggedInCubit({required this.isUserLoggedInUseCase}) : super(Initial());

  Future<void> isUserLoggedIn() async {
    emit(Loading());
    await isUserLoggedInUseCase.isLoggedIn().then((value) {
      if (value == true) {
        isUserSignedIn = value;
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
      print(isUserSignedIn);
    });
  }

  bool isUserLoggedInLocall() {
    return isUserSignedIn;
  }
}
