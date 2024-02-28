import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../FindFriend/FindFriendTile.dart';
import '../Modal/InfoModal.dart';

class FindFriendHomePageProvider extends ChangeNotifier {
  List<InfoModal> findFriendList = [];
  List<Widget> findFriendWidgetList = [];
  bool load = false;

  void start() {
    load = true;
    notifyListeners();
  }

  void end() {
    load = false;
    notifyListeners();
  }

  Future getDocs(String uid, String UserType) async {
    int k = -1;
    findFriendList.clear();
    findFriendWidgetList.clear();
    start();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("coworker")
        .orderBy("date")
        .get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      if (uid == querySnapshot.docs[i]["userId"] || uid == "") {
        k++;
        findFriendList.add(InfoModal(
            categoryImageURL: querySnapshot.docs[i]["categoryImageURL"],
            categoryTitle: querySnapshot.docs[i]["categoryTitle"],
            description: querySnapshot.docs[i]["description"],
            endDate: querySnapshot.docs[i]["endDate"],
            lat: querySnapshot.docs[i]["lat"],
            long: querySnapshot.docs[i]["long"],
            name: querySnapshot.docs[i]["name"],
            phone: querySnapshot.docs[i]["phone"],
            pincode: querySnapshot.docs[i]["pincode"],
            price: querySnapshot.docs[i]["price"],
            profileImageURl: querySnapshot.docs[i]["profileimageURL"],
            startDate: querySnapshot.docs[i]["startDate"],
            taskTitle: querySnapshot.docs[i]["taskTitle"],
            userID: querySnapshot.docs[i]["userId"],
            address: querySnapshot.docs[i]["address"],
            id: querySnapshot.docs[i].id));
        Widget a = ViewerTile(
          imageUrl: querySnapshot.docs[i]["profileimageURL"],
          category: querySnapshot.docs[i]["categoryTitle"],
          discription: querySnapshot.docs[i]["description"],
          price: querySnapshot.docs[i]["price"],
          name: querySnapshot.docs[i]["name"],
          index: k,
          userID: querySnapshot.docs[i]["userId"],
          documentID: querySnapshot.docs[i].id,
          userType: UserType,
        );

        findFriendWidgetList.add(a);
        notifyListeners();
      }
      end();
    }
  }
}
