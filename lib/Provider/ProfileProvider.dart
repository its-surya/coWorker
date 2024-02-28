import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../EntryPage/entryPage.dart';
import '../services/ShowSnackbar.dart';
import 'Provider.dart';

class ProfileProvider extends ChangeNotifier {
  bool calender = false;
  DateTime dateofbirth = DateTime.now();
  String? name;
  String? userName;
  SnackBarr snackBarr = SnackBarr();
  void nameF(String profileName) {
    name = profileName;
    notifyListeners();
  }

  void userNameF(String profileUserName) {
    userName = profileUserName;
    notifyListeners();
  }

  void calenderf() {
    calender = !calender;
    notifyListeners();
  }

  void dateofBirth(DateTime dob) {
    dateofbirth = dob;
    notifyListeners();
  }

  bool load = false;
  start() {
    load = true;
    notifyListeners();
  }

  end() {
    load = false;
    notifyListeners();
  }

  Future<void> addData(String imageUrl) async {
    try {
      await FirebaseFirestore.instance.collection("profile").add({
        'name': name,
        'imageUrl': imageUrl,
        'dateOfBirth': dateofbirth.toString(),
        'uid': FirebaseAuth.instance.currentUser?.uid,
      });
    } catch (e) {
      end();
    }

    end();
    notifyListeners();
  }

  String displayImage = "";
  String? displayName;
  Future<void> getProfileData() async {
    final result = await FirebaseFirestore.instance
        .collection('profile')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    displayName = result.docs[0]["name"];
    displayImage = result.docs[0]["imageUrl"];

    notifyListeners();
  }
}
