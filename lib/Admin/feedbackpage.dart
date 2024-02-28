import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';

class FeedBackAdminPage extends StatefulWidget {
  const FeedBackAdminPage({Key? key}) : super(key: key);

  @override
  State<FeedBackAdminPage> createState() => _FeedBackAdminPageState();
}

class _FeedBackAdminPageState extends State<FeedBackAdminPage> {
  ScrollController listScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: kBackground.copyWith(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("feedback")
                            .orderBy('date')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return CircularProgressIndicator(
                              color: Colors.white,
                            );
                          }
                          return ListView.builder(
                            controller: listScrollController,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (
                              context,
                              index,
                            ) {
                              Map<String, dynamic> document =
                                  snapshot.data?.docs[index].data()
                                      as Map<String, dynamic>;

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              document['senderName'],
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              document['text'],
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            },
                          );
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
