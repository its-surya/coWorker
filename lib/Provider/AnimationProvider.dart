import 'package:flutter/cupertino.dart';

class AnimationProvider extends ChangeNotifier{
  bool findFriendAnimation = true;
  void endanimation() {
    findFriendAnimation = false;
    notifyListeners();
  }


}