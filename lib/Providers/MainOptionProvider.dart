import 'package:flutter/widgets.dart';

class MainOptionProvider extends ChangeNotifier{

  Map<String, bool> mainOptions = {
  "info": true,
  "facilities": false,
  "products": false,
  "clients": false,
  };

  String current = "info";

  void updateCurrent(String option){
    mainOptions[current] = false;
    current = option;
    mainOptions[current] = true;
    notifyListeners();
  }
}