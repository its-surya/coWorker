import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:coworker/FindFriend/FindFriendsHomepage.dart';
import 'package:coworker/FindFriend/FriendsDetail.dart';
import 'package:coworker/FindFriend/service/delete.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/FindFriendHomePageProvider.dart';
import '../Provider/Provider.dart';
import 'FindFriendtileelement/AlertBox.dart';
import 'FindFriendtileelement/CircularAvitar.dart';
import 'FindFriendtileelement/PriceLable.dart';
import 'FindFriendtileelement/TextDetailofFriendTile.dart';

class ViewerTile extends StatelessWidget {
  final imageUrl;
  final category;
  final discription;
  final price;
  final name;
  final index;
  final documentID;
  final userID;
  final userType;
  ViewerTile({
    this.category = "",
    this.imageUrl = "",
    this.price = "",
    this.discription = "",
    this.name = "",
    this.index,
    this.userID,
    this.documentID,
    this.userType,
  });
  Delete delete = Delete();
  @override
  Widget build(BuildContext context) {
    return Consumer2<Providerr, FindFriendHomePageProvider>(
        builder: (context, Providerr, FindFriendHomePageProvider, child) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReciverDetail(
                      i: index,
                    )),
          );
        },
        child: Container(
          height: 155,
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 3,
            color: Colors.white.withOpacity(0.3),
            child: Row(
              children: [
                CircularAvatar(
                  imageUrl: imageUrl,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: TextDetail(
                        name: name,
                        category: category,
                        discription: discription),
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      child:
                          (userID == FirebaseAuth.instance.currentUser?.uid ||
                                  userType == 'admin')
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () async {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertBox(
                                                delete: delete,
                                                documentID: documentID,
                                                imageUrl: imageUrl);
                                          },
                                        );
                                      },
                                      child: Providerr.load
                                          ? const CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : const Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                    ),
                                  ))
                              : Container(),
                    ),
                    PriceLable(price: price),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
