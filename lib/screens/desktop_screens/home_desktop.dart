import 'package:flutter/material.dart';
import 'package:se_admin_app/models/client.dart';
import 'package:se_admin_app/models/facility.dart';
import 'package:se_admin_app/models/product.dart';
import 'package:se_admin_app/screens/desktop_screens/options_desktop/basic_info_options_desktop/contact_details_desktop.dart';
import 'package:se_admin_app/screens/desktop_screens/options_desktop/basic_info_options_desktop/director_info_desktop.dart';
import 'package:se_admin_app/utils/widgets/product_card.dart';
import '../../main.dart';
import '../../utils/colors.dart';
import '../../utils/widgets/client_card.dart';
import '../../utils/widgets/facility_card.dart';
import '../../utils/widgets/options.dart';
import 'options_desktop/basic_info_options_desktop/about_us_desktop.dart';
import 'options_desktop/facility_detail_desktop/facility_detail_desk.dart';
import 'options_desktop/key_clients_desktop/key_clients_desk.dart';
import 'options_desktop/product_detail_desk/product_details_desktop.dart';

class HomeScreenDesktop extends StatefulWidget {
  const HomeScreenDesktop({super.key});

  @override
  State<HomeScreenDesktop> createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop> {
  late TextEditingController introduction_tec;

  TextEditingController searchField = TextEditingController() ;

  // static variables
  // main options
  bool isInfo = true;
  bool isFacilities = false;
  bool isProducts = false;
  bool isClients = false;

  // for basic information

  bool isAbout = true;
  bool isContact = false;
  bool isDirector = false;

  // static lists
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

  Product? currProduct;
  Facility? currFacility;
  KClient? currClient;

  // search lists

  List<Product> searchProductList = [];
  List<Facility> searchFacilityList = [];
  List<KClient> searchClientsList = [];

  bool isSearching = false;

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

  // for dynamically handle click event
  Map<String, bool> isProductClicked = {};
  Map<String, bool> isFacilityClicked = {};
  Map<String, bool> isClientClicked = {};

  Map<String, bool> isSearchProductClicked = {};
  Map<String, bool> isSearchFacilityClicked = {};
  Map<String, bool> isSearchClientClicked = {};

  _HomeScreenDesktopState() {
    for (int i = 0; i < productList.length; i++) {
      isProductClicked['product$i'] = (i == 0);
    }

    for (int i = 0; i < facilityList.length; i++) {
      isFacilityClicked['facility$i'] = (i == 0);
    }

    for (int i = 0; i < clientList.length; i++) {
      isClientClicked['client$i'] = (i == 0);
    }

    currProduct = ((productList.isNotEmpty ? productList[0] : null)!);
    currFacility = ((facilityList.isNotEmpty ? facilityList[0] : null)!);
    currClient = ((clientList.isNotEmpty ? clientList[0] : null)!);
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.theme['primaryColor'],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: AppBar(
            backgroundColor: AppColors.theme['primaryColor'],
            flexibleSpace: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mq.width * 0.007, vertical: mq.height * 0.04),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 100,
                ),
                height: mq.height * 0.1,
                width: mq.width * 1,
                decoration: BoxDecoration(
                  color: AppColors.theme['tertiaryColor'],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white24,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                      child: Image.asset(
                        "assets/images/logos/se_fulllogo.png",
                        fit: BoxFit.cover,
                        width: mq.width * 0.1 > 200.0 ? mq.width * 0.2 : 200.0,
                        height:
                            mq.height * 0.1 > 200.0 ? mq.height * 0.2 : 200.0,
                      ),
                    ),
                    Text(
                      'Admin Panel',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.theme['secondaryColor'],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.white24),
                          ),
                          primary: AppColors.theme['primaryColor'],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                "L O G O U T",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: mq.width * 0.007, bottom: 10),
          child: Row(
            children: [
              // main options
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isFacilities = false;
                              isClients = false;
                              isProducts = false;
                              isInfo = true;
                            });
                          },
                          child: Options(
                            optionName: 'Basic information',
                            isClicked: isInfo,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isFacilities = false;
                              isClients = false;
                              isProducts = true;
                              isInfo = false;
                            });
                          },
                          child: Options(
                            optionName: 'Products',
                            isClicked: isProducts,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isFacilities = true;
                              isClients = false;
                              isProducts = false;
                              isInfo = false;
                            });
                          },
                          child: Options(
                            optionName: 'Facilities',
                            isClicked: isFacilities,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isFacilities = false;
                              isClients = true;
                              isProducts = false;
                              isInfo = false;
                            });
                          },
                          child: Options(
                            optionName: 'Key Clients',
                            isClicked: isClients,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: AppColors.theme['tertiaryColor'],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white24,
                  ),
                ),
                constraints: BoxConstraints(
                  minWidth: 190,
                ),
                height: mq.height * 1,
                width: mq.width * 0.1,
              ),
              SizedBox(width: mq.width * 0.007),

              // all main options tabs
              Column(
                children: [
                  if (!isInfo)
                    Padding(
                      padding: EdgeInsets.only(bottom: mq.width * 0.007),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: mq.width * 0.003,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.theme['primaryColor'],
                                border: Border.all(
                                  color: Colors.white24,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              constraints:
                                  BoxConstraints(minWidth: 200, minHeight: 50),
                              width: 200,
                              height: 50,
                              child: Center(
                                child: Container(
                                  width: 200,
                                  height: 50,
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (isProducts) isSearching = false;
                                          isSearching = false;
                                          isSearching = !isSearching;
                                          if (isFacilities) isSearching = false;
                                          isSearching = false;
                                          isSearching = !isSearching;
                                          if (isClients) isSearching = false;
                                          isSearching = false;
                                          isSearching = !isSearching;
                                        });
                                      },
                                      child: TextFormField(
                                        controller: searchField,
                                        enabled: (isSearching) ? true : false,
                                        onChanged: (val) {
                                          if (isProducts)
                                            searchProductList.clear();
                                          if (isFacilities)
                                            searchFacilityList.clear();
                                          if (isClients)
                                            searchClientsList.clear();

                                          if (isProducts)
                                            for (var i in productList) {
                                              if (i.name.toLowerCase().contains(
                                                  val.toLowerCase())) {
                                                searchProductList.add(i);
                                              }
                                              setState(() {
                                                ;
                                              });
                                            }

                                          if (isFacilities)
                                            for (var i in facilityList) {
                                              if (i.name.toLowerCase().contains(
                                                  val.toLowerCase())) {
                                                searchFacilityList.add(i);
                                              }
                                              setState(() {
                                                ;
                                              });
                                            }

                                          if (isClients)
                                            for (var i in clientList) {
                                              if (i.name.toLowerCase().contains(
                                                  val.toLowerCase())) {
                                                searchClientsList.add(i);
                                              }
                                              setState(() {
                                                ;
                                              });
                                            }
                                        },
                                        cursorColor:
                                            AppColors.theme['highlightColor'],
                                        style: TextStyle(
                                            color: AppColors
                                                .theme['secondaryColor']),
                                        textAlign: TextAlign.center,
                                        autocorrect: true,
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        decoration: InputDecoration(
                                          hintText: 'Search Here',
                                          hintStyle: TextStyle(
                                              color: AppColors
                                                  .theme['secondaryColor']),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: isSearching
                                ? () {
                                    setState(() {
                                      isSearching = false;
                                      searchField.text = "";
                                    });
                                  }
                                : () {},
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white24),
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.theme['tertiaryColor']),
                                height: 50,
                                width: 50,
                                child: Icon(
                                  isSearching
                                      ? Icons.cancel_outlined
                                      : Icons.add,
                                  color: AppColors.theme['secondaryColor'],
                                  size: 25,
                                )),
                          ),
                        ],
                      ),
                    ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              if (isInfo)
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isDirector = false;
                                      isContact = false;
                                      isAbout = true;
                                    });
                                  },
                                  child: Options(
                                    optionName: 'About Us',
                                    isClicked: isAbout,
                                  ),
                                ),
                              if (isInfo)
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isDirector = false;
                                      isContact = true;
                                      isAbout = false;
                                    });
                                  },
                                  child: Options(
                                    optionName: 'Contact Details',
                                    isClicked: isContact,
                                  ),
                                ),
                              if (isInfo)
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isDirector = true;
                                      isContact = false;
                                      isAbout = false;
                                    });
                                  },
                                  child: Options(
                                    optionName: 'Director info',
                                    isClicked: isDirector,
                                  ),
                                ),
                              if (isProducts)
                                (isSearching && searchProductList.isEmpty)
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: mq.height * 0.25),
                                        child: Text(
                                          "No Search Results",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white24),
                                        ),
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: isSearching
                                            ? searchProductList.length
                                            : productList.length,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                for (int i = 0;
                                                    isSearching
                                                        ? i <
                                                            searchProductList
                                                                .length
                                                        : i <
                                                            productList.length;
                                                    i++) {
                                                  if (i == index) {
                                                    isSearching
                                                        ? isSearchProductClicked[
                                                            'product$i'] = true
                                                        : isProductClicked[
                                                            'product$i'] = true;
                                                    print(
                                                        "#PDCT ${productList[i].name}");
                                                    currProduct = isSearching
                                                        ? searchProductList[i]
                                                        : productList[i];
                                                  } else {
                                                    isSearching
                                                        ? isSearchProductClicked[
                                                            'product$i'] = false
                                                        : isProductClicked[
                                                                'product$i'] =
                                                            false;
                                                  }
                                                }
                                              });
                                            },
                                            child: ProductCard(
                                              product: isSearching
                                                  ? searchProductList[index]
                                                  : productList[index],
                                              isClicked: isSearching
                                                  ? (isSearchProductClicked[
                                                          'product$index'] ??
                                                      false)
                                                  : (isProductClicked[
                                                          'product$index'] ??
                                                      false),
                                            ),
                                          );
                                        },
                                      ),
                              if (isFacilities)
                                (isSearching && searchFacilityList.isEmpty)
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: mq.height * 0.25),
                                        child: Text(
                                          "No Search Results",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white24),
                                        ),
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: isSearching
                                            ? searchFacilityList.length
                                            : facilityList.length,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                for (int i = 0;
                                                    isSearching
                                                        ? i <
                                                            searchFacilityList
                                                                .length
                                                        : i <
                                                            facilityList.length;
                                                    i++) {
                                                  if (i == index) {
                                                    isSearching
                                                        ? (isSearchFacilityClicked[
                                                                'facility$i'] =
                                                            true)
                                                        : (isFacilityClicked[
                                                                'facility$i'] =
                                                            true);
                                                    print(
                                                        "#PDCT ${facilityList[i].name}");
                                                    currFacility = isSearching
                                                        ? searchFacilityList[i]
                                                        : facilityList[i];
                                                  } else {
                                                    isSearching
                                                        ? (isSearchFacilityClicked[
                                                                'facility$i'] =
                                                            false)
                                                        : (isFacilityClicked[
                                                                'facility$i'] =
                                                            false);
                                                  }
                                                }
                                              });
                                            },
                                            child: FacilityCard(
                                              facility: isSearching
                                                  ? searchFacilityList[index]
                                                  : facilityList[index],
                                              isClicked: isSearching
                                                  ? (isSearchFacilityClicked[
                                                          'facility$index'] ??
                                                      false)
                                                  : (isFacilityClicked[
                                                          'facility$index'] ??
                                                      false),
                                            ),
                                          );
                                        },
                                      ),
                              if (isClients)
                                (isSearching && searchClientsList.isEmpty)
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: mq.height * 0.25),
                                        child: Text(
                                          "No Search Results",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white24),
                                        ),
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: isSearching
                                            ? searchClientsList.length
                                            : clientList.length,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                for (int i = 0;
                                                    isSearching
                                                        ? i <
                                                            searchClientsList
                                                                .length
                                                        : i < clientList.length;
                                                    i++) {
                                                  if (i == index) {
                                                    isSearching
                                                        ? isSearchClientClicked[
                                                            'client$i'] = true
                                                        : isClientClicked[
                                                            'client$i'] = true;
                                                    print(
                                                        "#PDCT ${productList[i].name}");
                                                    currClient = isSearching
                                                        ? searchClientsList[i]
                                                        : clientList[i];
                                                  } else {
                                                    isSearching
                                                        ? isSearchClientClicked[
                                                            'client$i'] = false
                                                        : isClientClicked[
                                                            'client$i'] = false;
                                                  }
                                                }
                                              });
                                            },
                                            child: ClientCard(
                                              client: isSearching
                                                  ? searchClientsList[index]
                                                  : clientList[index],
                                              isClicked: isSearching
                                                  ? (isSearchClientClicked[
                                                          'client$index'] ??
                                                      false)
                                                  : (isClientClicked[
                                                          'client$index'] ??
                                                      false),
                                            ),
                                          );
                                        },
                                      ),
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.theme['tertiaryColor'],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white24,
                        ),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 250,
                      ),
                      width: mq.width * 0.15,
                      height: mq.height * 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: mq.width * 0.007,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: mq.width * 0.007),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.theme['tertiaryColor'],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white24,
                      ),
                    ),
                    height: mq.height * 1,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isDirector && isInfo) DirectorInfoDesktop(),
                          if (isAbout && isInfo) AboutDesktop(),
                          if (isContact && isInfo) ContactDetailsDesktop(),
                          if (isProducts)
                            ProductDetailDesktop(
                              product: currProduct!,
                            ),
                          if (isFacilities)
                            FacilityDetailDesktop(
                              facility: currFacility!,
                            ),
                          if (isClients)
                            ClientsDetailDesktop(
                              client: currClient!,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
