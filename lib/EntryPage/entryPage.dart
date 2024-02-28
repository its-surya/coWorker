import 'package:coworker/EntryPage/EntryPageElement/EnableDisable.dart';
import 'package:coworker/constant/constant.dart';
import 'package:coworker/services/Logout.dart';
import 'package:coworker/services/ShowSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../Provider/ProfileProvider.dart';
import '../Provider/Provider.dart';
import '../TaskAdd/CategorySelectorpage.dart';
import 'EntryPageElement/AddButton.dart';
import 'EntryPageElement/FindFriendButton.dart';
import 'EntryPageElement/LogoutButton.dart';
import 'EntryPageElement/SideNavBar.dart';
import 'EntryPageElement/Thought1.dart';
import 'EntryPageElement/Thought2.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  State<EntryPage> createState() => _EntryPageState();
}

EnableDisable enableDisable = EnableDisable();

class _EntryPageState extends State<EntryPage> {
  Logout logout = Logout();
  SnackBarr snackBarr = SnackBarr();

  void initState() {
    super.initState();
    entryanimation();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await enableDisable.enableDisable(context);
      await Provider.of<ProfileProvider>(context, listen: false)
          .getProfileData();
    });
  }

  void entryanimation() async {
    await Future.delayed(const Duration(seconds: 2));

    Provider.of<Providerr>(context, listen: false).entryanimation();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Providerr>(builder: (context, Providerr, child) {
      return Scaffold(
        drawer: SideNavBar(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black, size: 30),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(right: 30),
              child: Text(
                "WElCOME",
                style: TextStyle(
                  color: Color(0xff07434D),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: kBackground.copyWith(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Providerr.entryAnimation
              ? Lottie.asset("assets/welcome.json")
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Thought1(),
                          Lottie.asset("assets/entry.json"),
                          const SizedBox(
                            height: 15,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Thought2(),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          !Providerr.enableDisable
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AddButton(),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    FindFriendButton(),
                                  ],
                                ),
                          const SizedBox(
                            height: 15,
                          ),
                          LogoutButton(logout: logout),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
