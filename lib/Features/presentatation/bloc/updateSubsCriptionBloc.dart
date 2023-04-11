import 'package:flutter_application_growx/Features/domain/entities/payPalEntity.dart';
import 'package:flutter_application_growx/Features/domain/entities/subscriptionPlanEntity.dart';
import 'package:flutter_application_growx/Features/domain/usecases/updateUserSubsCription.dart';
import 'package:flutter_application_growx/Features/domain/usecases/updatesubscriptionPlanPayPalUsecase.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/blocstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateSubscritionCubit extends Cubit<BlocStates> {
  UpdateSubsCriptionUseCase updateSubsCriptionUseCase;
  UpdatesubscriptionPlanPayPalUsecase updatesubscriptionPlanPayPalUsecase;
  UpdateSubscritionCubit(
      {required this.updateSubsCriptionUseCase,
      required this.updatesubscriptionPlanPayPalUsecase})
      : super(Initial());

  Future<void> updateSubscription(PayPalEntity payPalEntity,
      SubscriptionPlanEntity subscriptionPlanEntity) async {
    emit(Loading());
    await updateSubsCriptionUseCase
        .updateSubsCription(payPalEntity, subscriptionPlanEntity)
        .then((value) {
      print(value);
      if (value == "S") {
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
    });
  }

  Future<void> updateSubscriptionPlan(
      PayPalEntity payPalEntity,
      SubscriptionPlanEntity subscriptionPlanEntity,
      String payPalUserId) async {
    emit(Loading());
    await updatesubscriptionPlanPayPalUsecase
        .updateSubscriptionPlan(
            payPalEntity, subscriptionPlanEntity, payPalUserId)
        .then((value) {
      print("akskamks");

      if (value == "S") {
        emit(Sucessfull());
      } else {
        emit(Failure());
      }
    });
  }
}
