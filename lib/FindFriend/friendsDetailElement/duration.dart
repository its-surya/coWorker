import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/FindFriendHomePageProvider.dart';

class Durations extends StatelessWidget {
  const Durations({
    super.key,
    required this.i,
  });

  final i;

  @override
  Widget build(BuildContext context) {
    return Consumer<FindFriendHomePageProvider>(
        builder: (context, FindFriendHomePageProvider, child) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          "Duration :  \n                           " +
              FindFriendHomePageProvider.findFriendList
                  .elementAt(i)
                  .endDate!
                  .toDate()
                  .day
                  .toString()! +
              " / " +
              FindFriendHomePageProvider.findFriendList
                  .elementAt(i)
                  .endDate!
                  .toDate()
                  .month
                  .toString()! +
              " / " +
              FindFriendHomePageProvider.findFriendList
                  .elementAt(i)
                  .endDate!
                  .toDate()
                  .year
                  .toString()! +
              " \n                                    To \n                          " +
              FindFriendHomePageProvider.findFriendList
                  .elementAt(i)
                  .startDate!
                  .toDate()
                  .day
                  .toString()! +
              " / " +
              FindFriendHomePageProvider.findFriendList
                  .elementAt(i)
                  .startDate!
                  .toDate()
                  .month
                  .toString()! +
              " / " +
              FindFriendHomePageProvider.findFriendList
                  .elementAt(i)
                  .startDate!
                  .toDate()
                  .year
                  .toString()!,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
        ),
      );
    });
  }
}
