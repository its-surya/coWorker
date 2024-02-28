import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileExist {
  Future<bool> profileExist() async {
    final result = await FirebaseFirestore.instance
        .collection('profile')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    return result.docs.isNotEmpty;
  }
}
