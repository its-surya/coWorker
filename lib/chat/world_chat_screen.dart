import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworker/constant/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ntp/ntp.dart';
import 'package:provider/provider.dart';

import '../Provider/FindFriendHomePageProvider.dart';
import '../Provider/Provider.dart';
import '../Provider/chatProvider.dart';

class ChatScreen extends StatefulWidget {
  final i;
  final str;
  ChatScreen({this.i, this.str});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String loggedInUser = FirebaseAuth.instance.currentUser!.uid;
  TextEditingController _controller = TextEditingController();
  ScrollController listScrollController = ScrollController();

  DateTime? _ntpTime;
  Future<void> dateTime() async {
    DateTime _myTime = await NTP.now();
    setState(() {
      _ntpTime = _myTime;
      print(_ntpTime);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen();
  }

  bool splash = true;
  splashScreen() async {
    await Future.delayed(Duration(milliseconds: 2800));
    Provider.of<Providerr>(context, listen: false).endchatanimation();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Providerr>(builder: (context, Providerr, child) {
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
            child: Providerr.chatScreenAnimation
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset("assets/message.json"),
                      const Text(
                        "This is world chat",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          reverse: true,
                          child: Column(
                            children: [
                              StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection("world chat")
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

                                        return Align(
                                          alignment:
                                              loggedInUser == document['sender']
                                                  ? Alignment.topRight
                                                  : Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Material(
                                                elevation: 4,
                                                borderRadius: loggedInUser ==
                                                        document['sender']
                                                    ? const BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(15),
                                                        topLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(15))
                                                    : const BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(15),
                                                        topLeft:
                                                            Radius.circular(15),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                15)),
                                                color: (loggedInUser ==
                                                        document['sender'])
                                                    ? Colors.white
                                                        .withOpacity(0.1)
                                                    : Colors.white
                                                        .withOpacity(0.3),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        document['senderName'],
                                                        style: const TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        document['text'],
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.white),
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
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          controller: _controller,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            suffixIcon: Container(
                              child: GestureDetector(
                                onTap: () async {
                                  String text = _controller.text;
                                  _controller.clear();
                                  await dateTime();
                                  Providerr.username();
                                  await FirebaseFirestore.instance
                                      .collection("world chat")
                                      .add({
                                    'sender': loggedInUser,
                                    'text': text,
                                    'date': _ntpTime,
                                    'senderName': Providerr.userName,
                                  });
                                },
                                child: Icon(
                                  Icons.send,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "type your message",
                            hintStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.white, width: 2),
                              borderRadius: new BorderRadius.circular(
                                25.7,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 3)),
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                          ),
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
