import 'package:coworker/chat/world_chat_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../FindFriend/FindFriendsHomepage.dart';

class ChatTopNavBar extends StatefulWidget {
  const ChatTopNavBar({Key? key}) : super(key: key);

  @override
  State<ChatTopNavBar> createState() => _ChatTopNavBarState();
}

class _ChatTopNavBarState extends State<ChatTopNavBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            indicatorWeight: 3,
            indicatorPadding: const EdgeInsets.all(10),
            indicatorColor: Colors.black26.withOpacity(.4),
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                icon: Icon(
                  Icons.person,
                  color: Color(0xff07434D),
                  size: 30,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.chat,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          FindFriendHomePage(),
          ChatScreen(),
        ],
      ),
    );
    ;
  }
}
