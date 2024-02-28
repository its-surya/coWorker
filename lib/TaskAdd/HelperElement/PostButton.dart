import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  const PostButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 7, bottom: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Post',
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.arrow_right_alt,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
