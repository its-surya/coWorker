import 'package:flutter/material.dart';

class ImageUploadButton extends StatelessWidget {
  const ImageUploadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)),
      child: const Padding(
        padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 15, bottom: 15),
        child: Text(
          "Upload Image",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
