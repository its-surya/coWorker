import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/FindFriendHomePageProvider.dart';
import '../Provider/Provider.dart';
import '../constant/constant.dart';

class UserPost extends StatefulWidget {
  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<Providerr, FindFriendHomePageProvider>(
        builder: (context, Providerr, FindFriendHomePageProvider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: kBackground.copyWith(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Providerr.load
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                  : Column(
                      children: FindFriendHomePageProvider.findFriendWidgetList,
                    ),
            )),
      );
    });
  }
}
