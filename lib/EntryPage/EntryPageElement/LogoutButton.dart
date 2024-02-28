import 'package:flutter/material.dart';

import '../../SignUpLoginpages/loginpage.dart';
import '../../services/Logout.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
    required this.logout,
  });

  final Logout logout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        color: Colors.white,
        child: MaterialButton(
          onPressed: () async {
            await logout.logout();
            await Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false);
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
