import 'package:cloud_firestore/cloud_firestore.dart';

class ReciverListModel {
  String? reciverId;
  Timestamp? date;
  ReciverListModel({this.date, this.reciverId});
}
