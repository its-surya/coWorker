import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Logout {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future<void> logout() async {
    try {
      await _googleSignIn.signOut();
      await firebaseAuth.signOut();
    } catch (e) {}
  }
}
