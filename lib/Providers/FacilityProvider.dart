import 'package:flutter/widgets.dart';
import 'package:se_admin_app/models/facility.dart';


class FacilityProvider extends ChangeNotifier{
  Facility? current;
  bool isNew = false;

  List<Facility> searchFacility = [];
  List<Facility> facilityList = [];

  void updateSearchList(String searchText){
    searchFacility = facilityList
        .where((facility) =>
        facility.name.toLowerCase().startsWith(searchText)
    ).toList();
    searchFacility.sort((Facility a, Facility b) => a.name.compareTo(b.name));
    notifyListeners();
  }

  void removeFromSearchList(Facility product){
    searchFacility.remove(product);
    notifyListeners();
  }

  void updateCurrent(Facility newFacility){
    current = newFacility;
    notifyListeners();
  }
  void notify(){
    notifyListeners();
  }
}