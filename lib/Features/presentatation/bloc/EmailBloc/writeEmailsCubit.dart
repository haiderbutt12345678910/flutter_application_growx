import 'package:flutter_application_growx/Features/domain/entities/agentEmailEntity.dart';
import 'package:flutter_application_growx/Features/domain/usecases/EmailUseCases/writeEmailUseCase.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WriteEmailsCubit extends Cubit<BlocStates> {
  WriteEmailUseCase writeEmailsUseCase;

  WriteEmailsCubit({required this.writeEmailsUseCase}) : super(Initial());

  Future<void> writeEmail(UserEmailEntity emailEntity, String agentId) async {
    emit(Loading());
    await writeEmailsUseCase.readEmails(emailEntity, agentId).then((value) {
      if (value == "S") {
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
    });
  }
}
