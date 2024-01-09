import 'package:flutter/widgets.dart';
import '../models/client.dart';
import '../models/facility.dart';
import '../models/product.dart';

class ConstantsProvider extends ChangeNotifier{


  bool isInfo = true;
  bool isFacilities = false;
  bool isProducts = false;
  bool isClients = false;



  bool isAbout = true;
  bool isContact = false;
  bool isDirector = false;


  Map<String, bool> isProductClicked = {};
  Map<String, bool> isFacilityClicked = {};
  Map<String, bool> isClientClicked = {};

  Map<String, bool> isSearchProductClicked = {};
  Map<String, bool> isSearchFacilityClicked = {};
  Map<String, bool> isSearchClientClicked = {};



  Product? currProduct ;
  Facility? currFacility;
  KClient? currClient;



  List<Product> searchProductList = [];
  List<Facility> searchFacilityList = [];
  List<KClient> searchClientsList = [];
  List<Product> productList = [
    Product(name: "CNC Turning Fixtures", imagePath: ""),
    Product(name: "Hydraulic Fixtures", imagePath: ""),
    Product(name: "Mechanical Fixtures", imagePath: ""),
    Product(name: "Pneumatic Fixtures", imagePath: ""),
    Product(name: "Welding Fixtures", imagePath: ""),
    Product(name: "Inspection Fixtures", imagePath: ""),
    Product(name: "Standard Clamping", imagePath: ""),
    Product(name: "Jigs and Collets", imagePath: ""),
  ];


  List<Facility> facilityList = [
    Facility(name: "CNC Milling centre", imagePath: "", discription: ""),
    Facility(name: "CNC Lathe machine", imagePath: "", discription: ""),
    Facility(name: "Drilling machinee", imagePath: "", discription: ""),
    Facility(
        name: "Surface/Cylindrical grinding facility",
        imagePath: "",
        discription: ""),
    Facility(name: "Digital vernier calliper", imagePath: "", discription: ""),
    Facility(name: "Micrometers", imagePath: "", discription: ""),
    Facility(name: "Bore gauge set", imagePath: "", discription: ""),
    Facility(name: "Round Dial", imagePath: "", discription: ""),
    Facility(
        name: "Zero Grade Granite Surface Plate",
        imagePath: "",
        discription: ""),
    Facility(name: "Digital Height Gauge", imagePath: "", discription: ""),
  ];



  List<KClient> clientList = [
    KClient(name: "SUZUKI Motors Gujarat", imagePath: ""),
    KClient(name: "Tirth Agro Technologies", imagePath: ""),
    KClient(name: "Jyoti CNC Automation", imagePath: ""),
    KClient(name: "OFC (Ordnance Factory Kanpur) ", imagePath: ""),
    KClient(name: "Rainbow Techno cast", imagePath: ""),
    KClient(name: "Kaizen Ferro cast", imagePath: ""),
    KClient(name: "Omnitech Engineering", imagePath: ""),
    KClient(name: "HI-CON Techno cast", imagePath: ""),
    KClient(name: "Shreeram Aerospace Defence", imagePath: ""),
    KClient(name: "Shilpan Techno cast", imagePath: ""),
    KClient(name: "GN Altech", imagePath: ""),
    KClient(name: "Trishul Pump", imagePath: ""),
    KClient(name: "Rajoo Engineers", imagePath: ""),
    KClient(name: "Field Marshal Tractors", imagePath: ""),
    KClient(name: "SMPL,Ahmedabad", imagePath: ""),
  ];


  HomeScreenDesktopState() {
    print("#HS ${productList}") ;
    for (int i = 0; i < productList.length; i++) {
      isProductClicked['product$i'] = (i == 0);
    }

    for (int i = 0; i < facilityList.length; i++) {
      isFacilityClicked['facility$i'] = (i == 0);
    }

    for (int i = 0; i < clientList.length; i++) {
      isClientClicked['client$i'] = (i == 0);
    }

    currProduct = (productList.isNotEmpty ? productList[0] : null);
    currFacility = (facilityList.isNotEmpty ? facilityList[0] : null);
   currClient = (clientList.isNotEmpty ? clientList[0] : null);

    notifyListeners();
  }

  void callback(){
    notifyListeners();
  }

  // bool isClicked(String id){
  //
  //
  // }

}