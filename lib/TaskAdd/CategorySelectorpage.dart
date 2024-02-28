import 'package:coworker/constant/constant.dart';

import 'package:flutter/material.dart';

import 'HelperElement/categoryTile.dart';

class CategorySelectorPage extends StatefulWidget {
  const CategorySelectorPage({Key? key}) : super(key: key);

  @override
  State<CategorySelectorPage> createState() => _CategorySelectorPageState();
}

class _CategorySelectorPageState extends State<CategorySelectorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
          )),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: kBackground.copyWith(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50))),
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0, right: 16, left: 16),
            child: Column(
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Hello ! let's do the work together",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                CategoryTile(
                  imageUrl1:
                      "https://firebasestorage.googleapis.com/v0/b/coworker-f1931.appspot.com/o/category%2Frunner.png?alt=media&token=b713d3c4-f2a2-4285-beec-833cbf29dfab",
                  text1: "Running",
                  imageUrl2:
                      "https://firebasestorage.googleapis.com/v0/b/coworker-f1931.appspot.com/o/category%2Ffitness.png?alt=media&token=9ebc793e-9355-4ae5-9b70-07505f59570b",
                  text2: "Gym",
                ),
                CategoryTile(
                  imageUrl1:
                      "https://firebasestorage.googleapis.com/v0/b/coworker-f1931.appspot.com/o/category%2Fcooking.png?alt=media&token=9607a466-0386-476f-a8d0-6ac7043e8d5a",
                  text1: "Cooking",
                  imageUrl2:
                      "https://firebasestorage.googleapis.com/v0/b/coworker-f1931.appspot.com/o/category%2Fcleaning-service.png?alt=media&token=3237f084-d2cf-4f67-8f68-9dd745fa0d15",
                  text2: "Cleaning",
                ),
                CategoryTile(
                  imageUrl1:
                      "https://firebasestorage.googleapis.com/v0/b/coworker-f1931.appspot.com/o/category%2Ftravel.png?alt=media&token=24668fc5-226e-488a-aa63-85500ad7538d",
                  text1: "Travel",
                  imageUrl2:
                      "https://firebasestorage.googleapis.com/v0/b/coworker-f1931.appspot.com/o/category%2Fdance.png?alt=media&token=fcf7113e-892e-4b2c-abbf-c1d826ab3342",
                  text2: "Party",
                ),
                CategoryTile(
                  imageUrl1:
                      "https://firebasestorage.googleapis.com/v0/b/coworker-f1931.appspot.com/o/category%2Fcricket.png?alt=media&token=d38dfde2-0216-41a7-95a3-f6eb2223000a",
                  text1: "Playing",
                  imageUrl2:
                      "https://firebasestorage.googleapis.com/v0/b/coworker-f1931.appspot.com/o/category%2Fcoding.png?alt=media&token=c9a4e3fa-c283-40ad-bf33-02b160d38150",
                  text2: "Coding",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
