import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/Provider.dart';

class PaymentTextField extends StatelessWidget {
  const PaymentTextField({
    super.key,
    required TextEditingController? controller,
  }) : _controller = controller;

  final TextEditingController? _controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<Providerr>(builder: (context, Providerr, child) {
      return SizedBox(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller: _controller,
          enabled: Providerr.textFieldState,
          textAlign: TextAlign.center,
          cursorColor: Colors.white,
          style: TextStyle(
            fontSize: 60,
            color: Colors.white,
          ),
          autofocus: true,
          maxLines: null,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "₹",
            hintStyle: TextStyle(fontSize: 60, color: Colors.white),
            border: InputBorder.none,
          ),
        ),
      );
    });
  }
}
