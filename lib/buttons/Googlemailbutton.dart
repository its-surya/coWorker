import 'package:flutter/material.dart';

class GPEButton extends StatelessWidget {
  final ontap;
  final text;
  final logo;
  GPEButton({this.text, this.ontap, this.logo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                logo,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
