import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/Provider.dart';

class Calender extends StatelessWidget {
  const Calender({
    super.key,
    this.text,
  });
  final text;
  @override
  Widget build(BuildContext context) {
    return Consumer<Providerr>(builder: (context, Providerr, child) {
      return GestureDetector(
        onTap: () {
          showCustomDateRangePicker(
            context,
            dismissible: true,
            minimumDate: DateTime.now().subtract(const Duration(days: 30)),
            maximumDate: DateTime.now().add(const Duration(days: 30)),
            endDate: Providerr.endDate,
            startDate: Providerr.startDate,
            backgroundColor: Colors.white,
            primaryColor: Color(0xff07434D),
            onApplyClick: (start, end) {
              Providerr.date(start, end);
            },
            onCancelClick: () {},
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 2, color: Colors.white)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
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
                    text,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
