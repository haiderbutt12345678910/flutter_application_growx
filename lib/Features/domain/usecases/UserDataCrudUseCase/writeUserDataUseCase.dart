import '../../../data/remotedata/firebase_repocontart.dart';
import '../../entities/UserEntities/userdataentity.dart';

class WriteUserDataUseCase {
  final FirebaseRepocontart firebaseRepocontart;
  WriteUserDataUseCase({required this.firebaseRepocontart});

  Future<String> createUser(Userdataentity userdataentity) async {
    return await firebaseRepocontart.createUser(userdataentity);
  }
}
