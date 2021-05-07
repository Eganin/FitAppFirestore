import 'package:firebase_auth/firebase_auth.dart';

class UserApp{
  String id;

  UserApp.fromFirebase(FirebaseUser user){
    id = user.uid;
  }
}