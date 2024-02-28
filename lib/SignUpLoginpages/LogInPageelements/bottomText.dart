import 'package:flutter/material.dart';

import '../signuppage.dart';

class BottomText extends StatelessWidget {
  const BottomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Your first time?",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder:
                      (context, animation, secondaryAnimation) =>
                  const SignUpPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 2.0);
                    const end = Offset.zero;
                    const curve = Curves.linearToEaseOut;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ));
          },
          child: Text(
            "Signup",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 19,
                fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}

