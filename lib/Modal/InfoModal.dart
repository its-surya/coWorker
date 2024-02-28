import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class InfoModal {
  int? index;
  String? categoryImageURL;
  String? categoryTitle;
  String? description;
  Timestamp? endDate;
  double? lat;
  double? long;
  String? name;
  String? phone;
  String? pincode;
  String? price;
  String? id;
  String? profileImageURl;
  Timestamp? startDate;
  String? taskTitle;
  String? userID;
  String? address;

  InfoModal({
    this.name,
    this.description,
    this.phone,
    this.long,
    this.pincode,
    this.endDate,
    this.taskTitle,
    this.startDate,
    this.lat,
    this.price,
    this.categoryImageURL,
    this.categoryTitle,
    this.profileImageURl,
    this.userID,
    this.index,
    this.address,
    this.id,
  });
}
