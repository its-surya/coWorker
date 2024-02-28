import 'package:coworker/constant/constant.dart';
import 'package:coworker/services/Location_Service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../Provider/Provider.dart';

class ModalBottomSheets extends StatelessWidget {
  const ModalBottomSheets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Providerr>(builder: (context, Providerr, child) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration:
              kBackground.copyWith(borderRadius: BorderRadius.circular(40)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Providerr.selectedFile(false);
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1.5, color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.camera_alt,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Providerr.selectedFile(true);
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1.5, color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.photo,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
