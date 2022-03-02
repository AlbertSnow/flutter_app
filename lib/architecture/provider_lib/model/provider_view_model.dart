import 'package:flutter/material.dart';

///
class ProviderViewModel extends ChangeNotifier {
  num normalCount = 1;
  ValueNotifier<int> notifyCount = ValueNotifier(-1);

  void doWholeUpdate(bool isUpdate) {
    normalCount = 100;
    notifyCount.value = -100;
    if (isUpdate) {
      notifyListeners();
    }
  }

  void doPartialUpdate(bool isUpdate) {
    normalCount = 100;
    notifyCount.value = 100;
    if (isUpdate) {
      notifyCount.notifyListeners();
    }
  }

  doRest(bool bool) {
    normalCount = 1;
    notifyCount.value = -1;
    notifyListeners();
  }

  normalNotify() {
    notifyListeners();
  }

  partialNotify() {
    notifyCount.notifyListeners();
  }

}
