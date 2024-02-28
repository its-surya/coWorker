import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.description,
  });

  final description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        description,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white),
      ),
    );
  }
}
