import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserCredential?> registerWithEmailAndPassword(
      String email, password) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      log(user.user?.email ?? 'Null');
      return user;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(
      String email, password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
