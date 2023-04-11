import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_growx/Features/data/remotedata/firebase_repository_Impl.dart';
import 'package:flutter_application_growx/Features/data/repository/repoicontarctimpl.dart';
import 'package:flutter_application_growx/Features/domain/repository/repocontract.dart';
import 'package:flutter_application_growx/Features/domain/usecases/AgentUseCase/readAgentUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/AuthUserCases/isUserLoggedInUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/AuthUserCases/logOutUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/AuthUserCases/loginUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/AuthUserCases/signUpUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/ChatUseCase/readChatUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/ChatUseCase/updateChatOverViewUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/ChatUseCase/writeChatUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/EmailUseCases/readEmailUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/EmailUseCases/writeEmailUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/SubsCriptionPlanUseCases/readSubsCriptionPlansUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/UserDataCrudUseCase/readUserDataUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/UserDataCrudUseCase/updateUserDataUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/UserDataCrudUseCase/writeUserDataUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/VedioCallUseCaese/readVedioRequestUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/VedioCallUseCaese/writevVedioRequestUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/readVedioListUseCase.dart';
import 'package:flutter_application_growx/Features/domain/usecases/updateUserSubsCription.dart';
import 'package:flutter_application_growx/Features/domain/usecases/updatesubscriptionPlanPayPalUsecase.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AgentBloc/readAgentListCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AuthBloc/isUserLoggedInCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AuthBloc/logInCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AuthBloc/logOutCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/AuthBloc/signUpCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/ChatBloc/readChatCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/ChatBloc/updateChatOverViewCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/ChatBloc/writeChatCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/EmailBloc/readEmailsCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/EmailBloc/writeEmailsCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/SubsCriptionPalnsBloc/readSubscriptionPlanbloc.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/readUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/updateUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/UserDataBloc/writeUserCubit.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/VedioCallBloc/readVedioRequestBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/VedioCallBloc/writeVedioRequestBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/readVedioListBloc.dart';
import 'package:flutter_application_growx/Features/presentatation/bloc/updateSubsCriptionBloc.dart';
import 'package:get_it/get_it.dart';
import 'Features/data/remotedata/firebase_repocontart.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
//bloc
  sl.registerFactory<UpdateSubscritionCubit>(() => UpdateSubscritionCubit(
      updateSubsCriptionUseCase: sl.call(),
      updatesubscriptionPlanPayPalUsecase: sl.call()));

  //VedioCallBlcs
  sl.registerFactory<ReadVedioRequestBloc>(
      () => ReadVedioRequestBloc(readVedioRequestUseCase: sl.call()));
  sl.registerFactory<WriteVedioRequestBloc>(
      () => WriteVedioRequestBloc(writevVedioRequestUseCase: sl.call()));

  //readAgentBloc
  sl.registerFactory<ReadAgentListCubit>(
      () => ReadAgentListCubit(readAgentUseCase: sl.call()));
  //readVedios
  sl.registerFactory<RaedVedioListCubit>(
      () => RaedVedioListCubit(readVedioListUseCase: sl.call()));
  //authblocs
  sl.registerFactory<LogInCubit>(() => LogInCubit(logInUseCase: sl.call()));
  sl.registerFactory<SignUpCubit>(() => SignUpCubit(signUpUseCase: sl.call()));
  sl.registerFactory<IsUserLoggedInCubit>(
      () => IsUserLoggedInCubit(isUserLoggedInUseCase: sl.call()));
  sl.registerFactory<LogOutCubit>(() => LogOutCubit(logOutUseCase: sl.call()));

  //emailscubit
  sl.registerFactory<ReadEmailsCubit>(
      () => ReadEmailsCubit(readEmailUseCase: sl.call()));
  sl.registerFactory<WriteEmailsCubit>(
      () => WriteEmailsCubit(writeEmailsUseCase: sl.call()));

//SubsCRIPTIONPLANBLOC

  sl.registerFactory<ReadSubscriptionPlanbloc>(
      () => ReadSubscriptionPlanbloc(readSubsCriptionPlansUseCase: sl.call()));

// UserDataBloc

  sl.registerFactory<ReadUserCubit>(
      () => ReadUserCubit(readUserDataUseCase: sl.call()));

  sl.registerFactory<WriteUserCubit>(
      () => WriteUserCubit(writeUserDataUseCase: sl.call()));

  sl.registerFactory<UpdateUserCubit>(
      () => UpdateUserCubit(updateUserDataUseCase: sl.call()));

//ChatBloc
  sl.registerFactory<UpdateChatOverViewCubit>(
      () => UpdateChatOverViewCubit(updateChatOverViewUseCase: sl.call()));
  sl.registerFactory<WriteChatCubit>(
      () => WriteChatCubit(writechatUseCase: sl.call()));
  sl.registerFactory<ReadChatCubit>(
      () => ReadChatCubit(readChatUseCase: sl.call()));

//usecase
  sl.registerLazySingleton<UpdateSubsCriptionUseCase>(
      () => UpdateSubsCriptionUseCase(firebaseRepocontart: sl.call()));
  sl.registerLazySingleton<UpdatesubscriptionPlanPayPalUsecase>(() =>
      UpdatesubscriptionPlanPayPalUsecase(firebaseRepocontart: sl.call()));

//emailsUseCases
  sl.registerLazySingleton<ReadEmailUseCase>(
      () => ReadEmailUseCase(firebaseRepocontart: sl.call()));
  sl.registerLazySingleton<WriteEmailUseCase>(
      () => WriteEmailUseCase(firebaseRepocontart: sl.call()));

//chatUseCases
  sl.registerLazySingleton<WriteChatUseCase>(
      () => WriteChatUseCase(firebaseRepocontart: sl.call()));
  sl.registerLazySingleton<ReadChatUseCase>(
      () => ReadChatUseCase(firebaseRepocontart: sl.call()));
  sl.registerLazySingleton<UpdateChatOverViewUseCase>(
      () => UpdateChatOverViewUseCase(firebaseRepocontart: sl.call()));

//readAgent
  sl.registerLazySingleton<ReadAgentUseCase>(
      () => ReadAgentUseCase(firebaseRepocontart: sl.call()));
  //readVedios
  sl.registerLazySingleton<ReadVedioListUseCase>(
      () => ReadVedioListUseCase(firebaseRepocontart: sl.call()));

//AuthUseCases
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(firebaseRepocontart: sl.call()));

  sl.registerLazySingleton<LogOutUseCase>(
      () => LogOutUseCase(firebaseRepocontart: sl.call()));

  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(firebaseRepocontart: sl.call()));

  sl.registerLazySingleton<IsUserLoggedInUseCase>(
      () => IsUserLoggedInUseCase(firebaseRepocontart: sl.call()));

  //SubsCRIPTIONPLANBLOC

  sl.registerLazySingleton<ReadSubsCriptionPlansUseCase>(
      () => ReadSubsCriptionPlansUseCase(firebaseRepocontart: sl.call()));

//VedioRequestUseCase
  sl.registerLazySingleton<ReadVedioRequestUseCase>(
      () => ReadVedioRequestUseCase(firebaseRepocontart: sl.call()));
  sl.registerLazySingleton<WritevVedioRequestUseCase>(
      () => WritevVedioRequestUseCase(firebaseRepocontart: sl.call()));

  //UserDataUseCases

  sl.registerLazySingleton<ReadUserDataUseCase>(
      () => ReadUserDataUseCase(firebaseRepocontart: sl.call()));

  sl.registerLazySingleton<WriteUserDataUseCase>(
      () => WriteUserDataUseCase(firebaseRepocontart: sl.call()));
  sl.registerLazySingleton<UpdateUserDataUseCase>(
      () => UpdateUserDataUseCase(firebaseRepocontart: sl.call()));

//repository
  sl.registerLazySingleton<RepoContract>(
      () => Repoicontarctimpl(firebaseRepositoryImpl: sl.call()));

//datasource

  sl.registerLazySingleton<FirebaseRepocontart>(
    () => FirebaseRepositoryImpl(
        firebaseAuth: sl.call(),
        firebaseFirestore: sl.call(),
        firebaseMessaging: sl.call(),
        firebaseStorage: sl.call()),
  );

  //externel

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  // PayPalEnvironment paypalEnvironment = const PayPalEnvironment.sandbox(
  //     clientId: clientid, clientSecret: secretKey);
  // PayPalHttpClient payPalHttpClient = PayPalHttpClient(paypalEnvironment);
  sl.registerLazySingleton(() => firebaseFirestore);
  sl.registerLazySingleton(() => firebaseAuth);
  sl.registerLazySingleton(() => firebaseMessaging);
  sl.registerLazySingleton(() => firebaseStorage);

  // sl.registerLazySingleton(() => payPalHttpClient);
}
