import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworker/services/Logout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/Provider.dart';
import '../../SignUpLoginpages/signuppage.dart';
import '../../services/ShowSnackbar.dart';

class EnableDisable {
  SnackBarr snackBarr = SnackBarr();
  Logout logout = Logout();
  Future<void> enableDisable(BuildContext context) async {
    await Provider.of<Providerr>(context, listen: false).getAdminDocs();
    await Provider.of<Providerr>(context, listen: false).verifyEnableDisable();
    if (Provider.of<Providerr>(context, listen: false).senableDisable ==
        "disable") {
      logout.logout();
      snackBarr.showSnackBar(context, "Your account is disable");
      Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => SignUpPage()),
          (Route<dynamic> route) => false);
    }
    print(Provider.of<Providerr>(context, listen: false).senableDisable);
  }
}
