import 'package:coworker/ProfileDevelopment/profileHomePage.dart';
import 'package:coworker/constant/constant.dart';
import 'package:coworker/services/ProfileExist.dart';
import 'package:coworker/services/getUID.dart';
import 'package:coworker/services/googleSigninService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../buttons/Googlemailbutton.dart';
import '../EntryPage/entryPage.dart';
import 'LogInPageelements/bottomText.dart';
import 'LogInPageelements/emailButton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<LoginPage> {
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
                child: Hero(
                  tag: "image",
                  child: Lottie.asset("assets/handshake.json"),
                ),
              ),
              Text(
                "Login",
                style: GoogleFonts.orbitron(
                    fontStyle: FontStyle.italic,
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              wait == true
                  ? const CircularProgressIndicator(
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
                                      : const ProfileHomePage()),
                              (Route<dynamic> route) => false);
                        }
                      },
                    ),
              const SizedBox(
                height: 25,
              ),
              const EmailButton(),
              const SizedBox(
                height: 20,
              ),
              const BottomText()
            ],
          ),
        ),
      ),
    );
  }
}
