import 'package:flutter/material.dart';

class CircularAvatar extends StatelessWidget {
  const CircularAvatar({
    super.key,
    required this.imageUrl,
  });

  final imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 12),
      child: imageUrl == ""
          ? const CircleAvatar(
              backgroundImage: AssetImage("assets/profile.png"),
              backgroundColor: Colors.white,
              radius: 55,
            )
          : CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 55,
            ),
    );
  }
}
