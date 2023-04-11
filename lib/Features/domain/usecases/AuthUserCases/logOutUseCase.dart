import '../../../data/remotedata/firebase_repocontart.dart';

class LogOutUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  LogOutUseCase({required this.firebaseRepocontart});

  Future<String> logOut() {
    return firebaseRepocontart.logOut();
  }
}
