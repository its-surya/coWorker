import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Provider/FindFriendHomePageProvider.dart';
import '../chat/world_chat_screen.dart';
import '../constant/constant.dart';
import 'friendsDetailElement/ContactButton.dart';
import 'friendsDetailElement/circularAvatar.dart';
import 'friendsDetailElement/description.dart';
import 'friendsDetailElement/duration.dart';
import 'friendsDetailElement/name.dart';
import 'friendsDetailElement/taskTitle.dart';

class ReciverDetail extends StatelessWidget {
  final i;
  ReciverDetail({this.i});
  Future<void> _dialNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FindFriendHomePageProvider>(
        builder: (context, FindFriendHomePageProvider, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatScreen(
                          i: i,
                        )));
          },
          child: Icon(Icons.chat),
          backgroundColor: const Color(0xff07434D),
        ),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
            )),
        bottomNavigationBar: MaterialButton(
          onPressed: () async {
            _dialNumber(
                FindFriendHomePageProvider.findFriendList.elementAt(i).phone!);
          },
          child: const ContactMe(),
        ),
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
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      CircularAvatars(
                        i: i,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Name(
                        name: FindFriendHomePageProvider.findFriendList
                            .elementAt(i)
                            .name!,
                      ),
                      const Divider(color: Colors.white),
                      const SizedBox(
                        height: 40,
                      ),
                      TaskTitle(
                        taskTitle: FindFriendHomePageProvider.findFriendList
                            .elementAt(i)
                            .taskTitle!,
                      ),
                      const Divider(color: Colors.white),
                      const SizedBox(
                        height: 20,
                      ),
                      Description(
                          description: FindFriendHomePageProvider.findFriendList
                              .elementAt(i)
                              .description!),
                      const Divider(
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Durations(i: i),
                      const Divider(color: Colors.white),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Location: ${FindFriendHomePageProvider.findFriendList.elementAt(i).address!}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                      const Divider(color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
