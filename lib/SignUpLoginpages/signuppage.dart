import 'package:coworker/ProfileDevelopment/profileHomePage.dart';

import 'package:coworker/constant/constant.dart';
import 'package:coworker/services/ProfileExist.dart';

import 'package:coworker/services/googleSigninService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../buttons/Googlemailbutton.dart';
import '../EntryPage/entryPage.dart';
import '../services/getUID.dart';
import 'Emailsignuppage.dart';
import 'loginpage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool wait = false;

  GoogleSignInService googleSignInService = GoogleSignInService();
  UID uid = UID();
  ProfileExist profileExist = ProfileExist();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: kBackground,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            children: [
              Flexible(
                child: Container(
                  child: Hero(
                    tag: "image",
                    child: Lottie.asset("assets/handshake.json"),
                  ),
                ),
              ),
              Text(
                "Signup",
                style: GoogleFonts.orbitron(
                    fontStyle: FontStyle.italic,
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              wait == true
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : GPEButton(
                      logo: "assets/google.png",
                      text: "Continue with Google",
                      ontap: () async {
                        setState(() {
                          wait = true;
                        });
                        await googleSignInService.googleSignIn(context);
                        if (googleSignInService.userCredential != null) {
                          await uid.uid();
                          bool pe = await profileExist.profileExist();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => pe
                                      ? const EntryPage()
                                      : ProfileHomePage()),
                              (Route<dynamic> route) => false);
                        }
                      },
                    ),
              SizedBox(
                height: 25,
              ),
              GPEButton(
                logo: "assets/mail.png",
                text: "Continue with mail",
                ontap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const EmailSignUpPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(0.0, 2.0);
                          const end = Offset.zero;
                          const curve = Curves.linearToEaseOut;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ));
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have we met before?",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const LoginPage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(0.0, 2.0);
                              const end = Offset.zero;
                              const curve = Curves.linearToEaseOut;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 19,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
