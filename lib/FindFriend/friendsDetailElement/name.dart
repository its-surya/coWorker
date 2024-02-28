import 'package:flutter/material.dart';
class Name extends StatelessWidget {
  const Name({
    super.key,

    required this.name
  });
  final name;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        name,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white),
      ),
    );
  }
}
