import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/FindFriendHomePageProvider.dart';
import '../../chat/chat_top_Nav_Bar.dart';

class FindFriendButton extends StatelessWidget {
  const FindFriendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FindFriendHomePageProvider>(
        builder: (context, FindFriendHomePageProvider, child) {
      return Container(
        color: Colors.white,
        child: MaterialButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatTopNavBar()),
            );
            FindFriendHomePageProvider.getDocs("", "user");
          },
          child: const Text("Find Friend"),
        ),
      );
    });
  }
}
