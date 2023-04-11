import 'package:flutter_application_growx/Features/domain/entities/subscriptionPlanEntity.dart';
import 'package:flutter_application_growx/Features/domain/usecases/SubsCriptionPlanUseCases/readSubsCriptionPlansUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocstate.dart';

class ReadSubscriptionPlanbloc extends Cubit<BlocStates> {
  ReadSubsCriptionPlansUseCase readSubsCriptionPlansUseCase;
  List<SubscriptionPlanEntity> subscriptionPlanList = [];

  ReadSubscriptionPlanbloc({required this.readSubsCriptionPlansUseCase})
      : super(Initial());

  Future<void> readPlans() async {
    emit(Loading());
    readSubsCriptionPlansUseCase.readPlans().then((value) {
      if (value.isNotEmpty) {
        subscriptionPlanList = value.toList();
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
    });
  }

  List<SubscriptionPlanEntity> readListLocall() {
    return subscriptionPlanList;
  }
}
