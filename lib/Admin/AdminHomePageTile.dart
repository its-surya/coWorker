import 'package:coworker/Admin/Userpost.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/FindFriendHomePageProvider.dart';
import '../Provider/Provider.dart';

class AdminHomePageTile extends StatelessWidget {
  final name;
  final uid;
  final docID;
  final status;

  AdminHomePageTile({this.name, this.uid, this.docID, this.status});

  @override
  Widget build(BuildContext context) {
    return Consumer2<Providerr,FindFriendHomePageProvider>(builder: (context, Providerr,FindFriendHomePageProvider, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            print(uid);
          },
          child: Container(
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      " name: $name",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          FindFriendHomePageProvider.getDocs(uid, "admin");

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserPost()),
                          );
                        },
                        child: Text("view"),
                        color: Colors.white,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Providerr.disableEnable(docID, status);
                          Providerr.getAdminDocs();
                        },
                        child: Text(status),
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
