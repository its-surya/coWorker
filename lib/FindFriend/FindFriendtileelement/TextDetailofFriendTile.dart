import 'package:flutter/material.dart';
class TextDetail extends StatelessWidget {
  const TextDetail({
    super.key,
    required this.name,
    required this.category,
    required this.discription,
  });

  final  name;
  final  category;
  final  discription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            category,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0, top: 8),
          child: SizedBox(
            width: 80,
            child: Text(
              discription,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}

