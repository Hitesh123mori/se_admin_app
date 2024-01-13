import 'package:flutter/widgets.dart';

class InfoProvider extends ChangeNotifier{

  Map<String, bool> options = {
    "Director Information": true,
    "About Us": false,
    "Contact Us": false,
  };

  String current = "Director Information";

  void updateCurrent(String option){
    options[current] = false;
    current = option;
    options[current] = true;
    notifyListeners();
  }
}