import 'package:flutter/material.dart';
class ContactMe extends StatelessWidget {
  const ContactMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Contact me',
          style: TextStyle(fontSize: 19),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.call)
      ],
    );
  }
}

