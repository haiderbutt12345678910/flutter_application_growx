import '../../../data/remotedata/firebase_repocontart.dart';

class IsUserLoggedInUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  IsUserLoggedInUseCase({required this.firebaseRepocontart});

  Future<bool> isLoggedIn() {
    return firebaseRepocontart.isLoggedIn();
  }
}
