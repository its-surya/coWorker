import 'package:flutter/material.dart';

class Thought1 extends StatelessWidget {
  const Thought1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 12),
      child: Text(
        "Alone we can do so little, together we can do so much",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
      ),
    );
  }
}
