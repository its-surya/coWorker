import 'package:coworker/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../Provider/AnimationProvider.dart';
import '../Provider/FindFriendHomePageProvider.dart';
import '../Provider/Provider.dart';

class FindFriendHomePage extends StatefulWidget {
  const FindFriendHomePage({Key? key}) : super(key: key);

  @override
  State<FindFriendHomePage> createState() => _FindFriendHomePageState();
}

class _FindFriendHomePageState extends State<FindFriendHomePage> {
  @override
  void initState() {
    animation();
    super.initState();
  }

  void animation() async {
    await Future.delayed(const Duration(seconds: 3));
    Provider.of<AnimationProvider>(context, listen: false).endanimation();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AnimationProvider, FindFriendHomePageProvider>(
        builder: (context, AnimationProvider, FindFriendHomePageProvider, child) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: kBackground.copyWith(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: AnimationProvider.findFriendAnimation
            ? Lottie.asset("assets/findFriend.json")
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 12, left: 12),
                  child: FindFriendHomePageProvider.load
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : Column(children: FindFriendHomePageProvider.findFriendWidgetList),
                ),
              ),
      );
    });
  }
}
