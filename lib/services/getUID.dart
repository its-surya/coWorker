import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UID {
  Future<bool> uidAlreadyExsist() async {
    final result = await FirebaseFirestore.instance
        .collection('getUid')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    return result.docs.isEmpty;
  }

  Future<void> uid() async {
    if (await uidAlreadyExsist() == true) {
      try {
        String uid = FirebaseAuth.instance.currentUser!.uid;
        String? email = FirebaseAuth.instance.currentUser!.email;
        String? name;
        if (email != null) {
          name = email;
        }

        await FirebaseFirestore.instance.collection('getUid').add({
          'uid': uid,
          'name': name,
          "status": 'enable',
        });

        print(FirebaseAuth.instance.currentUser?.uid.toString());
      } catch (e) {
        print(e);
      }
    }
  }
}
