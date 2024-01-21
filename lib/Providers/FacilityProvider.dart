import 'package:flutter/widgets.dart';
import 'package:se_admin_app/models/facility.dart';


class FacilityProvider extends ChangeNotifier{
  Facility? current;

  void updateCurrent(Facility newFacility){
    current = newFacility;
    notifyListeners();
  }
  void notify(){
    notifyListeners();
  }
}