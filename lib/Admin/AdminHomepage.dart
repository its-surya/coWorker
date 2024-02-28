import 'package:coworker/Admin/feedbackpage.dart';
import 'package:coworker/FeedBack/feedbackHomepage.dart';
import 'package:coworker/services/Logout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Provider.dart';
import '../SignUpLoginpages/loginpage.dart';
import '../constant/constant.dart';
import 'AdminHomePageTile.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Providerr>(context, listen: false).getAdminDocs();
    });
  }

  Logout logout = Logout();
  @override
  Widget build(BuildContext context) {
    return Consumer<Providerr>(builder: (context, Providerr, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "Admin Pannel",
                    style: TextStyle(
                        color: Color(0xff18666A),
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  logout.logout();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false);
                },
                child: Icon(
                  Icons.logout,
                  size: 25,
                  color: Color(0xff18666A),
                ),
              )
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: kBackground.copyWith(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FeedBackAdminPage()),
                      );
                    },
                    child: Text("FeedBack"),
                    color: Colors.white,
                  ),
                  Providerr.load
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Column(
                          children: Providerr.admintile,
                        ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
