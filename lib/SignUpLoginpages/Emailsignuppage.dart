import 'package:coworker/ProfileDevelopment/profileHomePage.dart';
import 'package:coworker/Provider/Provider.dart';
import 'package:coworker/EntryPage/entryPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../constant/constant.dart';
import '../services/ShowSnackbar.dart';
import '../services/emailservice.dart';
import '../services/getUID.dart';

class EmailSignUpPage extends StatefulWidget {
  const EmailSignUpPage({Key? key}) : super(key: key);

  @override
  State<EmailSignUpPage> createState() => _EmailSignUpPageState();
}

class _EmailSignUpPageState extends State<EmailSignUpPage> {
  TextEditingController _emailControler = TextEditingController();
  TextEditingController _passwordControler = TextEditingController();
  bool wait = false;
  Email email = Email();
  SnackBarr snackBarr = SnackBarr();
  UID uid = UID();

  UserCredential? signupCredential;
  UserCredential? loginCredential;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: "image",
                child: Container(
                  child: Lottie.asset("assets/handshake.json"),
                ),
              ),
            ),
            Text(
              'Signup',
              style: GoogleFonts.orbitron(
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: TextField(
                style: TextStyle(color: Colors.white, fontSize: 18),
                controller: _emailControler,
                decoration: kTextUsernameDecoration,
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  controller: _passwordControler,
                  obscureText: true,
                  decoration: kTextpasswordDecoration),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    wait = true;
                  });
                  try {
                    signupCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailControler.text.trim(),
                            password: _passwordControler.text.trim());
                    await uid.uid();
                  } catch (e) {
                    setState(() {
                      wait = false;
                    });
                    snackBarr.showSnackBar(context,
                        "Some error has occurred, please fill text field correctly");
                  }

                  if (signupCredential != null) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const ProfileHomePage()),
                        (Route<dynamic> route) => false);
                  }
                },
                child: wait == true
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Container(
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
                                'Signup',
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
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
