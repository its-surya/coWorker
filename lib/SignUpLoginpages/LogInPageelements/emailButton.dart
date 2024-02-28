import 'package:flutter/material.dart';

import '../../buttons/Googlemailbutton.dart';
import '../Emailloginpage.dart';

class EmailButton extends StatelessWidget {
  const EmailButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GPEButton(
      logo: "assets/mail.png",
      text: "Continue with email",
      ontap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                EmailLoginPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 2.0);
              const end = Offset.zero;
              const curve = Curves.linearToEaseOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
    );
  }
}
