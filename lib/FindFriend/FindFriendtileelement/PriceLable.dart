import 'package:flutter/material.dart';
class PriceLable extends StatelessWidget {
  const PriceLable({
    super.key,
    required this.price,
  });

  final  price;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              price != "" ? "₹  $price" : "Free",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

