import 'package:flutter/widgets.dart';

class MainOptionProvider extends ChangeNotifier{

  Map<String, bool> mainOptions = {
  "Primary Information": true,
  "Products": false,
  "Facilities": false,
  "Clients": false,
  };

  String current = "Primary Information";

  void updateCurrent(String option){
    mainOptions[current] = false;
    current = option;
    mainOptions[current] = true;
    notifyListeners();
  }
}