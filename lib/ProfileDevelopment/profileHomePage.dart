import 'package:coworker/Provider/ProfileProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../TaskAdd/HelperElement/ImageContainer.dart';
import '../TaskAdd/HelperElement/InputText.dart';
import '../TaskAdd/HelperElement/modalBottomSheet.dart';
import '../constant/constant.dart';
import 'Elements/SubmitButton.dart';
import 'Elements/calender.dart';

class ProfileHomePage extends StatefulWidget {
  const ProfileHomePage({Key? key}) : super(key: key);

  @override
  State<ProfileHomePage> createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
        builder: (context, ProfileProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Profile",
            style: TextStyle(
              color: Color(0xff07434D),
            ),
          )),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: kBackground.copyWith(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 30.0, right: 16, left: 16, bottom: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Textfield(
                    title: 'Name',
                    onChange: (val) {
                      ProfileProvider.nameF(val);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ProfileCalender(),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.white.withOpacity(0.1),
                          context: context,
                          builder: (context) {
                            return const ModalBottomSheets();
                          });
                    },
                    child: const ImageContainer(),
                  ),
                  !ProfileProvider.load
                      ? ProfileSubmitButton()
                      : const CircularProgressIndicator(
                          color: Colors.white,
                        )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
