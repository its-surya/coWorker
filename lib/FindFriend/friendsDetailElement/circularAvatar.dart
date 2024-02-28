import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/FindFriendHomePageProvider.dart';

class CircularAvatars extends StatelessWidget {
  const CircularAvatars({
    super.key,
    required this.i,
  });

  final  i;

  @override
  Widget build(BuildContext context) {
  return Consumer<FindFriendHomePageProvider>(builder: (context, FindFriendHomePageProvider, child)
  {
    return Align(
      alignment: Alignment.topCenter,
      child: Hero(
        tag: "image",
        child: FindFriendHomePageProvider.findFriendList
            .elementAt(i)
            .profileImageURl !=
            null
            ? CircleAvatar(
          backgroundImage: NetworkImage(FindFriendHomePageProvider
              .findFriendList
              .elementAt(i)
              .profileImageURl!),
          backgroundColor:
          Colors.white.withOpacity(0.4),
          radius: 75,
        )
            : CircleAvatar(
          backgroundImage:
          const AssetImage("assets/profile.png"),
          backgroundColor:
          Colors.white.withOpacity(0.4),
          radius: 50,
        ),
      ),
    );
  });
  }
}
