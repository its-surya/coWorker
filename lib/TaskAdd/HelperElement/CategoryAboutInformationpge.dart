import 'package:flutter/material.dart';

class CategoryInInformationPage extends StatelessWidget {
  final text;
  final imageUrl;
  CategoryInInformationPage({this.text = "", this.imageUrl = ""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            border: Border.all(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                child: Image.network(
                  imageUrl,
                ),
                backgroundColor: Colors.white.withOpacity(0.3),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
