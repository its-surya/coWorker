import 'package:coworker/FindFriend/service/delete.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/FindFriendHomePageProvider.dart';
import '../../Provider/Provider.dart';
class AlertBox extends StatelessWidget {
  const AlertBox({
    super.key,
    required this.delete,
    required this.documentID,
    required this.imageUrl,
  });

  final Delete delete;
  final  documentID;
  final  imageUrl;

  @override
  Widget build(BuildContext context) {
    return Consumer2<Providerr,FindFriendHomePageProvider>(builder: (context, Providerr,FindFriendHomePageProvider, child)
    {
      return AlertDialog(
        elevation: 5,
        backgroundColor: Color(0xff18666A),
        title: Text(
          "Are you Sure ? You want to delete it",
          style:
          TextStyle(color: Colors.white),
        ),
        actions: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () async {
                  Navigator.pop(context);
                  FindFriendHomePageProvider.start();
                  await delete.delete(documentID, imageUrl);
                  FindFriendHomePageProvider.end();
                  FindFriendHomePageProvider.getDocs(
                      "", 'user');
                },
                child: Text("Yes"),
                color: Colors.white,
              ),
              SizedBox(
                width: 15,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No"),
                color: Colors.white,
              ),
            ],
          ),
        ],
      );
    });
  }
}

