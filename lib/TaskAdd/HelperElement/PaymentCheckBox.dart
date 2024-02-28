import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/Provider.dart';

class PaymentCheckBox extends StatelessWidget {
  const PaymentCheckBox({
    super.key,
    required TextEditingController? controller,
  }) : _controller = controller;

  final TextEditingController? _controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<Providerr>(builder: (context, Providerr, child) {
      return CheckboxListTile(
        selectedTileColor: Color(0xff07434D),

        title: Text(
          "I dont want Money",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        value: Providerr.checkedValue,
        onChanged: (newValue) {
          _controller?.clear();
          Providerr.ckeck(newValue!);
        },
        controlAffinity:
            ListTileControlAffinity.leading, //  <-- leading Checkbox
      );
    });
  }
}
