import 'package:coworker/LandingPage/List.dart';
import 'package:coworker/SignUpLoginpages/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BoradingLayout.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPageValue = 0;
  Lists lists = Lists();
  _storeOnBoard() async {
    int isViewed = 0;
    SharedPreferences prefes = await SharedPreferences.getInstance();
    await prefes.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              itemCount: lists.onboardingList.length,
              onPageChanged: (value) {
                setState(() {
                  currentPageValue = value;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingLayout(
                  image: lists.onboardingList[index]['image'],
                  title: lists.onboardingList[index]['title'],
                  details: lists.onboardingList[index]['details'],
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    lists.onboardingList.length,
                    (int index) {
                      return buildPageIndicator(index: index);
                    },
                  ),
                ),
              ),
            ),
            currentPageValue != 2
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          _storeOnBoard();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage()),
                              (Route<dynamic> route) => false);
                        },
                        child: Container(
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
                                  'Continue',
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
                  )
          ],
        ),
      ),
    );
  }

  Widget buildPageIndicator({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      height: 8.0,
      width: currentPageValue == index ? 24.0 : 8.0,
      margin: EdgeInsets.only(left: 8.0),
      decoration: BoxDecoration(
        color: currentPageValue == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
