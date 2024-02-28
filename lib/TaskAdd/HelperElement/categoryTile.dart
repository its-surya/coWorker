import 'package:coworker/TaskAdd/HelperElement/top_navBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/Provider.dart';
import '../CategorySelectorpage.dart';

class CategoryTile extends StatelessWidget {
  final text1;
  final text2;
  final imageUrl1;
  final imageUrl2;
  CategoryTile(
      {this.imageUrl1 = "",
      this.imageUrl2 = "",
      this.text1 = "",
      this.text2 = ""});

  @override
  Widget build(BuildContext context) {
    return Consumer<Providerr>(builder: (context, Providerr, child) {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Providerr.categoryImageTitle(imageUrl1, text1);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TopNavBar(
                              image: imageUrl1,
                              text: text1,
                            )),
                  );
                },
                child: Container(
                  height: 140,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: Image.network(
                              imageUrl1,
                              scale: 8,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        text1,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Providerr.categoryImageTitle(imageUrl2, text2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TopNavBar(
                              image: imageUrl2,
                              text: text2,
                            )),
                  );
                },
                child: Container(
                  height: 140,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: Image.network(
                              imageUrl2,
                              scale: 8,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        text2,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
