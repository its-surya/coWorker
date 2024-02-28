import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworker/chat/chat_top_Nav_Bar.dart';
import 'package:coworker/constant/constant.dart';
import 'package:coworker/services/ShowSnackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/FindFriendHomePageProvider.dart';
import '../Provider/Provider.dart';
import '../services/Location_Service.dart';
import 'HelperElement/PaymentCheckBox.dart';
import 'HelperElement/PaymentTextField.dart';
import 'HelperElement/PostButton.dart';

class PaymentInputPage extends StatefulWidget {
  const PaymentInputPage({Key? key}) : super(key: key);

  @override
  State<PaymentInputPage> createState() => _PaymentInputPageState();
}

class _PaymentInputPageState extends State<PaymentInputPage> {
  TextEditingController? _controller = TextEditingController();
  LocationService locationService = LocationService();
  SnackBarr snackBarr = SnackBarr();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBackground.copyWith(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40))),
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Consumer2<Providerr, FindFriendHomePageProvider>(
          builder: (context, Providerr, FindFriendHomePageProvider, child) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Set a budget for your task ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PaymentTextField(controller: _controller),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: <Widget>[PaymentCheckBox(controller: _controller)],
                ),
                GestureDetector(
                  onTap: () async {
                    if (Providerr.name.toString() == "" ||
                        Providerr.phone.toString() == "" ||
                        Providerr.taskTitle.toString() == "" ||
                        Providerr.description.toString() == "") {
                      snackBarr.showSnackBar(
                          context, "Please enter all the fields");
                    } else if (Providerr.address.toString() ==
                        "Get your Location") {
                      snackBarr.showSnackBar(context,
                          "First on your Location then tap to location button");
                    } else {
                      Providerr.start();
                      await FirebaseFirestore.instance
                          .collection("coworker")
                          .add({
                        "date": DateTime.now(),
                        "name": Providerr.name.toString(),
                        "phone": Providerr.phone.toString(),
                        "taskTitle": Providerr.taskTitle.toString(),
                        "description": Providerr.description.toString(),
                        "categoryTitle": Providerr.title.toString(),
                        "categoryImageURL": Providerr.image.toString(),
                        "lat": Providerr.lat,
                        "long": Providerr.long,
                        "startDate": Providerr.startDate,
                        "endDate": Providerr.endDate,
                        "pincode": Providerr.pincode.toString(),
                        "price": _controller?.text.toString(),
                        "profileimageURL": Providerr.profileImageURL.toString(),
                        "userId":
                            FirebaseAuth.instance.currentUser!.uid.toString(),
                        "address": Providerr.address.toString(),
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatTopNavBar()),
                      );
                      Providerr.end();
                      FindFriendHomePageProvider.getDocs("", "user");
                      Providerr.clear();
                    }
                  },
                  child: Providerr.load
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const PostButton(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
