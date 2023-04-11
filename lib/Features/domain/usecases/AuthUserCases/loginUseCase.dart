import '../../../data/remotedata/firebase_repocontart.dart';

class LoginUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  LoginUseCase({required this.firebaseRepocontart});

  Future<String> logIn(String email, String password) {
    return firebaseRepocontart.logIn(email, password);
  }
}
