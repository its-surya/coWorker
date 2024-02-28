import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Delete{
  Future<void> delete(String documentID,imageUrl)async{
    await FirebaseFirestore
        .instance
        .collection('coworker')
        .doc(documentID)
        .delete();
    FirebaseStorage.instance
        .refFromURL(imageUrl)
        .delete();

  }
}