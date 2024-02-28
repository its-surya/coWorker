import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final title;
  final keyBoardType;
  final controler;
  final maxline;
  final onChange;
  Textfield(
      {this.title,
      this.keyBoardType = TextInputType.text,
      this.controler,
      this.maxline = 1,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      onChanged: onChange,
      maxLines: maxline,
      controller: controler,
      keyboardType: keyBoardType,
      textAlign: TextAlign.center,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: title,
        hintStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        label: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            backgroundColor: Color(0xff07434D),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.white, width: 2),
          borderRadius: new BorderRadius.circular(
            25.7,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3)),
        border: OutlineInputBorder(borderSide: BorderSide()),
      ),
    );
  }
}
