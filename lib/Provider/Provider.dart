import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworker/Admin/AdminHomePageTile.dart';
import 'package:coworker/Modal/AdminPageModal.dart';
import 'package:coworker/services/Location_Service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Providerr extends ChangeNotifier {
  ///////////////////////Location Start/////////////////
  String? pincode;
  double? lat;
  double? long;
  String address = "Get your Location";
  bool locationLoading = false;
  LocationService locationService = LocationService();
  getLatLong() async {
    Future<Position> data = locationService.determinePosition();
    data.then((value) {
      print("value $value");
      lat = value.latitude;
      long = value.longitude;
      getAddress(value.latitude, value.longitude);
    }).catchError((error) {
      print("Error $error");
    });
    notifyListeners();
  }

  getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

    address = placemarks[0].country! +
        "," +
        placemarks[0].administrativeArea! +
        "," +
        placemarks[0].street! +
        "," +
        placemarks[0].locality! +
        "," +
        placemarks[0].postalCode!;
    pincode = placemarks[0].postalCode!;
    locationLoading = false;
    notifyListeners();
  }

  ///////////////////////clear button////////////
  void clear() {
    name = "";
    phone = '';
    taskTitle = '';
    description = '';
    address = "Get your Location";
    selectedFileName = "";
    file = null;
    notifyListeners();
  }

  ////////////////////////Location end/////////////
  /////////////////information collector//////////
  String? name = "", phone = "", taskTitle = "", description = "";

  void names(String nam) {
    name = nam;
    notifyListeners();
  }

  void phones(String phon) {
    phone = phon;
    notifyListeners();
  }

  void taskTitles(String tasktitle) {
    taskTitle = tasktitle;
    notifyListeners();
  }

  void descriptions(String desc) {
    description = desc;
    notifyListeners();
  }

  bool checkedValue = false;
  bool textFieldState = true;

  void ckeck(bool newValue) {
    textFieldState = !newValue!;
    checkedValue = newValue!;
    notifyListeners();
  }

////////////////////////////// informationcollector date picker//////////////////////////

  DateTime? startDate = DateTime.now();
  DateTime? endDate = DateTime.now();

  void date(DateTime start, DateTime end) {
    endDate = end;
    startDate = start;
    notifyListeners();
  }

  /////////////category image url & title///////////////
  String? image, title;

  void categoryImageTitle(String imageUrl, String Title) {
    image = imageUrl;
    title = Title;
    notifyListeners();
  }

  /////////////////////Image Picker/////////////////////
  XFile? file;
  String selectedFileName = "";

  selectedFile(bool imageFrom) async {
    file = await ImagePicker().pickImage(
        source: imageFrom ? ImageSource.gallery : ImageSource.camera);
    if (file != null) {
      print(true);
      selectedFileName = file!.name;
    }
    notifyListeners();
  }

  ////////////////upload//////////////

  bool load = false;
  String profileImageURL = "";
  void start() {
    load = true;
    notifyListeners();
  }

  void end() {
    load = false;
    notifyListeners();
  }

  uploadFile(String fileName) async {
    profileImageURL = "";
    try {
      firebase_storage.UploadTask uploadTask;
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child(fileName)
          .child('/' + file!.name);
      uploadTask = ref.putFile(File(file!.path));
      await uploadTask.whenComplete(() => null);
      profileImageURL = await ref.getDownloadURL();
      print(profileImageURL);
    } catch (e) {
      print(e);
    }
    end();
    notifyListeners();
  }

  String userName = "";
////////////////////////////////getting user name for Admin page//////////////////
  Future<void> username() async {
    if (FirebaseAuth.instance.currentUser!.email != null) {
      userName = FirebaseAuth.instance.currentUser!.email!;
    } else {
      userName = FirebaseAuth.instance.currentUser!.phoneNumber!;
    }
    print(userName);
  }

/////////////////////////////list for Admin home page ////////////////
  List<AdminModal> adminelement = [];
  List<Widget> admintile = [];

  Future getAdminDocs() async {
    try {
      adminelement.clear();
      admintile.clear();

      start();
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("getUid").get();

      for (int i = 0; i < querySnapshot.docs.length; i++) {
        adminelement.add(AdminModal(
          uid: querySnapshot.docs[i]["uid"],
          name: querySnapshot.docs[i]["name"],
          status: querySnapshot.docs[i]["status"],
        ));
        Widget a = AdminHomePageTile(
          uid: querySnapshot.docs[i]["uid"],
          name: querySnapshot.docs[i]["name"],
          status: querySnapshot.docs[i]["status"],
          docID: querySnapshot.docs[i].id,
        );

        admintile.add(a);
        notifyListeners();
      }
      end();
    } catch (e) {
      print(e);
    }
  }

  ///////////////enable disbale user///////////////////////

  void disableEnable(String id, String Status) {
    String? status;
    if (Status == 'disable') {
      status = 'enable';
    } else {
      status = "disable";
    }
    FirebaseFirestore.instance
        .collection("getUid")
        .doc(id)
        .update({'status': status});
    notifyListeners();
  }

  /////////////verify enable disable//////////////////////////
  bool enableDisable = false;
  String? senableDisable;
  verifyEnableDisable() {
    username();
    for (int i = 0; i < adminelement.length; i++) {
      if (userName == adminelement.elementAt(i).name) {
        if (adminelement.elementAt(i).status == "enable") {
          senableDisable = "enable";
          enableDisable = true;
        } else {
          senableDisable = "disable";
          enableDisable = false;
        }
      }
    }
    notifyListeners();
  }

//////////////////////////////chat Animation/////////////////////
  bool chatScreenAnimation = true;
  void endchatanimation() {
    chatScreenAnimation = false;
    notifyListeners();
  }

  bool entryAnimation = true;
  void entryanimation() {
    entryAnimation = false;
    notifyListeners();
  }
}
