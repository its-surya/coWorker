import 'package:coworker/FeedBack/feedbackHomepage.dart';
import 'package:coworker/LandingPage/OnBoardingHomepage.dart';
import 'package:coworker/Provider/AnimationProvider.dart';
import 'package:coworker/Provider/ProfileProvider.dart';
import 'package:coworker/Provider/Provider.dart';
import 'package:coworker/SignUpLoginpages/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Admin/AdminHomepage.dart';
import 'Admin/feedbackpage.dart';
import 'ProfileDevelopment/profileHomePage.dart';
import 'Provider/FindFriendHomePageProvider.dart';
import 'EntryPage/entryPage.dart';
import 'Provider/chatProvider.dart';

int? isViewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    chrekIflogin();

    // TODO: implement initState
    super.initState();
  }

  var auth = FirebaseAuth.instance;
  bool isLogin = false;
  bool isAdmin = false;

  chrekIflogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
      }
    });
    if (FirebaseAuth.instance.currentUser!.email.toString() ==
        "admin@gmail.com") {
      setState(() {
        isAdmin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Providerr(),
        ),
        ChangeNotifierProvider(
          create: (_) => AnimationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FindFriendHomePageProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isViewed != null
            ? (isLogin
                ? isAdmin
                    ? const AdminHomePage()
                    : const EntryPage() /////
                : const SignUpPage())
            : OnboardingPage(),
      ),
    );
  }
}
