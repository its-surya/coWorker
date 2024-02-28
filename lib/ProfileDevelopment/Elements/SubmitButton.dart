import 'package:coworker/EntryPage/entryPage.dart';
import 'package:coworker/services/ShowSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/ProfileProvider.dart';
import '../../Provider/Provider.dart';

class ProfileSubmitButton extends StatefulWidget {
  @override
  State<ProfileSubmitButton> createState() => _ProfileSubmitButtonState();
}

class _ProfileSubmitButtonState extends State<ProfileSubmitButton> {
  @override
  SnackBarr snackBarr = SnackBarr();

  Widget build(BuildContext context) {
    return Consumer2<ProfileProvider, Providerr>(
        builder: (context, ProfileProvider, Providerr, child) {
      return GestureDetector(
        onTap: () async {
          final n = Navigator.of(context);
          ProfileProvider.start();
          try {
            await Providerr.uploadFile("profileImage");
            await ProfileProvider.addData(Providerr.profileImageURL);
            n.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const EntryPage()),
                (Route<dynamic> route) => false);
          } catch (e) {
            ProfileProvider.end();
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width - 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 7, bottom: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Submit',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
