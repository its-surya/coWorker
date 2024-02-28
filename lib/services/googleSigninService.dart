import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'ShowSnackbar.dart';

class GoogleSignInService {
  SnackBarr snackBarr=SnackBarr();
  UserCredential? userCredential;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future<void> googleSignIn(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        try {
          userCredential = await firebaseAuth.signInWithCredential(credential);
        } catch (e) {
          snackBarr.showSnackBar(context,"Some error has been occurred");
        }
      } else {}
    } catch (e) {
      snackBarr.showSnackBar(context,"Some error has been occurred");
    }
  }
}
