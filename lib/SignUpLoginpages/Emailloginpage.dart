import 'package:coworker/Admin/AdminHomepage.dart';
import 'package:coworker/constant/constant.dart';
import 'package:coworker/services/emailservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../EntryPage/entryPage.dart';
import '../services/ShowSnackbar.dart';

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({super.key});

  @override
  _EmailLoginPageState createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  Email email = Email();
  bool wait = false;
  TextEditingController _emailControler = TextEditingController();
  TextEditingController _passwordControler = TextEditingController();
  SnackBarr snackBarr = SnackBarr();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
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
            const SizedBox(
              height: 20,
            ),
            Text(
              'Login',
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
                style: const TextStyle(color: Colors.white, fontSize: 18),
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
            const SizedBox(height: 15.0),
            GestureDetector(
              onTap: () {
                email.reset(_emailControler.text.trim());
              },
              child: const Text(
                "Forgot password?",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    wait = true;
                  });

                  try {
                    await firebaseAuth.signInWithEmailAndPassword(
                        email: _emailControler.text.trim(),
                        password: _passwordControler.text.trim());
                  } catch (e) {
                    snackBarr.showSnackBar(context,
                        "Some error has occurred, please fill text field correctly");
                    setState(() {
                      wait = false;
                    });
                  }

                  if (loginCredential != null) {
                    (_emailControler.text.trim() == "admin@gmail.com" &&
                            _passwordControler.text.trim() == "admin1001@")
                        ? Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const AdminHomePage()),
                            (Route<dynamic> route) => false)
                        : Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const EntryPage()),
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
                                'Login',
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
