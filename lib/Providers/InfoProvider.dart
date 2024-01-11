import 'package:flutter/widgets.dart';

class InfoProvider extends ChangeNotifier{

  Map<String, bool> options = {
    "director": true,
    "aboutUs": false,
    "contact": false,
  };

  String current = "director";

  void updateCurrent(String option){
    options[current] = false;
    current = option;
    options[current] = true;
    notifyListeners();
  }
}