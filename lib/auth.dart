import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Future<bool> signIn(
      {@required String email, @required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message ?? "Unknown Error");
      return false;
    }
  }

  Future<bool> signUp(
      {@required String name,
      @required String email,
      @required String password}) async {
    try {
      var result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await result.user?.updateDisplayName(name);
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message ?? "Unknown Error");
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message ?? "Unknown Error");
      return false;
    }
  }

  Future<dynamic> getCurrentUser() async {
    try {
      var user = _firebaseAuth.currentUser;
      return user;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message ?? "Unknown Error");
      return false;
    }
  }
}
