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

class HomeScreenDesktop extends StatefulWidget {
  const HomeScreenDesktop({super.key});

  @override
  State<HomeScreenDesktop> createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop> {
  late TextEditingController introduction_tec;

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
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10),
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
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: productList.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    for (int i = 0;
                                        i < productList.length;
                                        i++) {
                                      if (i == index) {
                                        isProductClicked['product$i'] = true;
                                      } else {
                                        isProductClicked['product$i'] = false;
                                      }
                                    }
                                  });
                                },
                                child: ProductCard(
                                  product: productList[index],
                                  isClicked:
                                      isProductClicked['product$index'] ??
                                          false,
                                ),
                              );
                            },
                          ),
                        if (isFacilities)
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: facilityList.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    for (int i = 0;
                                        i < productList.length;
                                        i++) {
                                      if (i == index) {
                                        isFacilityClicked['facility$i'] = true;
                                      } else {
                                        isFacilityClicked['facility$i'] = false;
                                      }
                                    }
                                  });
                                },
                                child: FacilityCard(
                                  facility: facilityList[index],
                                  isClicked:
                                      isFacilityClicked['facility$index'] ??
                                          false,
                                ),
                              );
                            },
                          ),
                        if (isClients)
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: clientList.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    for (int i = 0;
                                        i < clientList.length;
                                        i++) {
                                      if (i == index) {
                                        isClientClicked['client$i'] = true;
                                      } else {
                                        isClientClicked['client$i'] = false;
                                      }
                                    }
                                  });
                                },
                                child: ClientCard(
                                  client: clientList[index],
                                  isClicked:
                                     isClientClicked['client$index'] ??
                                          false,
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
