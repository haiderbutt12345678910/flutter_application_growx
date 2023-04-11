import 'package:flutter_application_growx/Features/domain/entities/agentEmailEntity.dart';
import 'package:flutter_application_growx/Features/domain/usecases/EmailUseCases/readEmailUseCase.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadEmailsCubit extends Cubit<BlocStates> {
  ReadEmailUseCase readEmailUseCase;
  UserEmailEntity userEmail = UserEmailEntity();

  ReadEmailsCubit({required this.readEmailUseCase}) : super(Initial());

  Future<void> readEmails(String agentId) async {
    emit(Loading());
    await readEmailUseCase.readEmails(agentId).then((value) {
      if (value != null) {
        if (value.email == "") {
          emit(Sucessfull());
        } else {
          userEmail = value;
          emit(Sucessfull());
        }
      } else {
        emit(Failure());
      }
    });
  }

  UserEmailEntity readEmailsLocall() {
    return userEmail;
  }
}
