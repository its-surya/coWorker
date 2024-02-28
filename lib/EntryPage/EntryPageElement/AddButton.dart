import 'package:flutter/material.dart';

import '../../TaskAdd/CategorySelectorpage.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategorySelectorPage()),
          );
        },
        child: const Text("Add"),
      ),
    );
  }
}
