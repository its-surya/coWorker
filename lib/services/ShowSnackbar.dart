import 'package:flutter/material.dart';

class SnackBarr {
  void showSnackBar(BuildContext context, String text) {
    final snackbar = SnackBar(
        backgroundColor: Color(0xff18666A).withOpacity(0.4),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        content: Row(
          children: [
            Image.asset(
              "assets/snackbarIcon.png",
              scale: 25,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(child: Text(text)),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
