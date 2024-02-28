import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/ProfileProvider.dart';

class ProfileCalender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
        builder: (context, ProfileProvider, child) {
      return GestureDetector(
        onTap: () {
          ProfileProvider.calenderf();
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(width: 2, color: Colors.white)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.white,
                      size: 38,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Date of birth:  ${ProfileProvider.dateofbirth.day}/ ${ProfileProvider.dateofbirth.month}/ ${ProfileProvider.dateofbirth.year}",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            !ProfileProvider.calender
                ? Container()
                : Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                    height: 200,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime:
                          DateTime.now().subtract(Duration(days: 600)),
                      maximumYear:
                          DateTime.now().subtract(Duration(days: 356)).year,
                      onDateTimeChanged: (val) {
                        ProfileProvider.dateofBirth(val);
                      },
                    ),
                  ),
          ],
        ),
      );
    });
  }
}
