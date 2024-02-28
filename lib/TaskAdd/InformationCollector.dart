import 'dart:io';
import 'package:coworker/constant/constant.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../Provider/Provider.dart';

import 'HelperElement/Calender.dart';
import 'HelperElement/CategoryAboutInformationpge.dart';
import 'HelperElement/ImageContainer.dart';
import 'HelperElement/InputText.dart';
import 'HelperElement/LocationAboutinformation.dart';
import 'HelperElement/imageuploadButton.dart';
import 'HelperElement/modalBottomSheet.dart';

class InformationCollectors extends StatelessWidget {
  final imageUrl;
  final text;
  InformationCollectors({this.text = "", this.imageUrl = ""});
  @override
  Widget build(BuildContext context) {
    return Consumer<Providerr>(builder: (context, Providerr, child) {
      return Container(
        height: MediaQuery.of(context).size.height,
        decoration: kBackground.copyWith(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50), topLeft: Radius.circular(50))),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Textfield(
                    onChange: (String s) {
                      Providerr.names(s);
                    },
                    title: "Name",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Textfield(
                    onChange: (String s) {
                      Providerr.phones(s);
                    },
                    title: "Phone",
                    keyBoardType: TextInputType.number,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Textfield(
                      onChange: (String s) {
                        Providerr.taskTitles(s);
                      },
                      title: "Task Title",
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Textfield(
                      onChange: (String s) {
                        Providerr.descriptions(s);
                      },
                      title: "Description",
                      maxline: 5,
                    )),
                SizedBox(
                  height: 20,
                ),
                CategoryInInformationPage(text: text, imageUrl: imageUrl),
                LocationAbouInfo(),
                SizedBox(
                  height: 10,
                ),
                Calender(
                    text:
                        '${DateFormat("dd, MMM").format(Providerr.startDate!)} / ${DateFormat("dd, MMM").format(Providerr.endDate!)}'),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.white.withOpacity(0.1),
                        context: context,
                        builder: (context) {
                          return ModalBottomSheets();
                        });
                  },
                  child: Column(
                    children: [
                      ImageContainer(),
                      GestureDetector(
                        onTap: () {
                          Providerr.uploadFile('taskUploadImage');
                          Providerr.start();
                        },
                        child: const ImageUploadButton(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
