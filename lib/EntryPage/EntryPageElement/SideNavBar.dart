import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../FeedBack/feedbackHomepage.dart';
import '../../Provider/ProfileProvider.dart';
import '../../TaskAdd/CategorySelectorpage.dart';
import '../../chat/chat_top_Nav_Bar.dart';
import '../../constant/constant.dart';

class SideNavBar extends StatefulWidget {
  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
        builder: (context, ProfileProvider, child) {
      return Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), bottomRight: Radius.circular(40)),
        ),
        elevation: 0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: kBackground.copyWith(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: DrawerHeader(
                child: Column(
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              NetworkImage(ProfileProvider.displayImage),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ProfileProvider.displayName != null
                          ? ProfileProvider.displayName!
                          : "unknown",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 5,
                  child: ListTile(
                    title: const Text('Add',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xff07434D), fontSize: 15)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategorySelectorPage()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 5,
                  child: ListTile(
                    title: const Text('FeedBack',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xff07434D), fontSize: 15)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FeedBackHomePage()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                      "This app is currently in its beta version, so some features and functionality may still be in development and subject to improvement"),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
