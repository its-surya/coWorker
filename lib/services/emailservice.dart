import 'package:coworker/services/ShowSnackbar.dart';
import 'package:coworker/services/getUID.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Email {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<void> signup(
      String email, String password, BuildContext context) async {}

  Future<void> reset(String email) async {
    try {
      firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
  }
}
