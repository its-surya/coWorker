import 'package:flutter/material.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:intl/intl.dart';

const kTextUsernameDecoration = InputDecoration(
  labelText: 'Email',
  labelStyle: TextStyle(
    color: Colors.white,
  ),
  prefixIcon: Icon(
    Icons.person,
    color: Colors.white,
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black26, width: 3),
  ),
);
const kTextpasswordDecoration = InputDecoration(
  labelText: 'Password',
  labelStyle: TextStyle(
    color: Colors.white,
  ),
  prefixIcon: Icon(
    Icons.lock,
    color: Colors.white,
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black26, width: 3),
  ),
);
const kBackground = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color(0xff07434D),
      Color(0xff18666A),
    ],
  ),
);

const kOtpDecoration = InputDecoration(
  labelText: 'OTP',
  labelStyle: TextStyle(
    color: Colors.white,
  ),
  prefixIcon: Icon(
    Icons.messenger_outline_outlined,
    color: Colors.white,
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black26, width: 3),
  ),
);
const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);
const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
