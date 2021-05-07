import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_test/domain/user.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<UserApp> signInWithEmailAndPassword(
      {String email, String password}) async {
    try {
      AuthResult result = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return UserApp.fromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserApp> registerWithEmailAndPassword(
      {String email, String password}) async {
    try {
      AuthResult result = await _fAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return UserApp.fromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future logOut() async => await _fAuth.signOut();

  Stream<UserApp> get currentUser {
    return _fAuth.onAuthStateChanged.map(
      (FirebaseUser user) => user != null ? UserApp.fromFirebase(user) : null,
    );
  }
}
