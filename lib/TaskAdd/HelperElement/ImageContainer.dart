import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/Provider.dart';
import 'imageuploadButton.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Providerr>(builder: (context, Providerr, child) {
      return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.white),
                    color: Colors.white.withOpacity(0.3)),
                child: Providerr.selectedFileName != ""
                    ? Container(
                        child: Providerr.load
                            ? Stack(children: [
                                Center(
                                    child:
                                        Image.file(File(Providerr.file!.path))),
                                const Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.white,
                                )),
                              ])
                            : Image.file(File(Providerr.file!.path)),
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add a photo",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      );
    });
  }
}
