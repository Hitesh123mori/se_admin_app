import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/models/client.dart';
import 'package:se_admin_app/models/facility.dart';
import 'package:se_admin_app/models/product.dart';
import 'package:se_admin_app/screens/desktop_screens/options_desktop/basic_info_options_desktop/contact_details_desktop.dart';
import 'package:se_admin_app/screens/desktop_screens/options_desktop/basic_info_options_desktop/director_info_desktop.dart';
import 'package:se_admin_app/utils/widgets/product_card.dart';
import '../../constant/constants_provider.dart';
import '../../main.dart';
import '../../utils/colors.dart';
import '../../utils/widgets/client_card.dart';
import '../../utils/widgets/facility_card.dart';
import '../../utils/widgets/options.dart';
import 'build_home_desktop/appbar_desktop.dart';
import 'build_home_desktop/build_main_menubar_desktop.dart';
import 'options_desktop/basic_info_options_desktop/about_us_desktop.dart';
import 'options_desktop/facility_detail_desktop/facility_detail_desk.dart';
import 'options_desktop/key_clients_desktop/key_clients_desk.dart';
import 'options_desktop/product_detail_desk/product_details_desktop.dart';

class HomeScreenDesktop extends StatefulWidget {
  final ConstantsProvider value;
  const HomeScreenDesktop({super.key, required this.value});

  @override
  State<HomeScreenDesktop> createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop> {
  late TextEditingController introduction_tec;

  TextEditingController searchField = TextEditingController();

  bool isSearching = false;


  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Consumer<ConstantsProvider>(
      builder: (context, value, child) {
        value.HomeScreenDesktopState();
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColors.theme['primaryColor'],
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(150.0),
            child: AppbarDesktop(),
          ),
          body: Padding(
            padding: EdgeInsets.only(left: mq.width * 0.007, bottom: 10),
            child: Row(
              children: [
                // main options
                MainMenubarDesktop(),
                SizedBox(width: mq.width * 0.007),

                // all main options tabs
                Column(
                  children: [
                    if (!value.isInfo)
                      Padding(
                        padding: EdgeInsets.only(bottom: mq.width * 0.007),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: mq.width * 0.007,
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
                                    BoxConstraints(minWidth: 190, minHeight: 50),
                                width: 190,
                                height: 50,
                                child: Center(
                                  child: Container(
                                    width: 200,
                                    height: 50,
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (value.isProducts) isSearching = false;
                                            isSearching = false;
                                            isSearching = !isSearching;
                                            if (value.isFacilities) isSearching = false;
                                            isSearching = false;
                                            isSearching = !isSearching;
                                            if (value.isClients) isSearching = false;
                                            isSearching = false;
                                            isSearching = !isSearching;
                                          });
                                        },
                                        child: TextFormField(
                                          controller: searchField,
                                          enabled: (isSearching) ? true : false,
                                          onChanged: (val) {
                                            if (value.isProducts)
                                              value.searchProductList.clear();
                                            if (value.isFacilities)
                                              value.searchFacilityList.clear();
                                            if (value.isClients)
                                              value.searchClientsList.clear();

                                            if (value.isProducts)
                                              for (var i in value.productList) {
                                                if (i.name.toLowerCase().contains(
                                                    val.toLowerCase())) {
                                                  value.searchProductList.add(i);
                                                }
                                                setState(() {
                                                  ;
                                                });
                                              }

                                            if (value.isFacilities)
                                              for (var i in value.facilityList) {
                                                if (i.name.toLowerCase().contains(
                                                    val.toLowerCase())) {
                                                  value.searchFacilityList.add(i);
                                                }
                                                setState(() {
                                                  ;
                                                });
                                              }

                                            if (value.isClients)
                                              for (var i in value.clientList) {
                                                if (i.name.toLowerCase().contains(
                                                    val.toLowerCase())) {
                                                  value.searchClientsList.add(i);
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 10),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                if (value.isInfo)
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        value.isDirector = false;
                                        value.isContact = false;
                                        value.isAbout = true;
                                      });
                                    },
                                    child: Options(
                                      optionName: 'About Us',
                                      isClicked: value.isAbout,
                                    ),
                                  ),
                                if (value.isInfo)
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        value.isDirector = false;
                                        value.isContact = true;
                                        value.isAbout = false;
                                      });
                                    },
                                    child: Options(
                                      optionName: 'Contact Details',
                                      isClicked: value.isContact,
                                    ),
                                  ),
                                if (value.isInfo)
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        value.isDirector = true;
                                        value.isContact = false;
                                        value.isAbout = false;
                                      });
                                    },
                                    child: Options(
                                      optionName: 'Director info',
                                      isClicked: value.isDirector,
                                    ),
                                  ),
                                if (value.isProducts)
                                  (isSearching && value.searchProductList.isEmpty)
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
                                              ? value.searchProductList.length
                                              : value.productList.length,
                                          physics: BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  for (int i = 0;
                                                      isSearching
                                                          ? i <
                                                          value.searchProductList
                                                                  .length
                                                          : i <
                                                          value.productList.length;
                                                      i++) {
                                                    if (i == index) {
                                                      isSearching
                                                          ? value.isSearchProductClicked[
                                                              'product$i'] = true
                                                          : value.isProductClicked[
                                                              'product$i'] = true;
                                                      print(
                                                          "#PDCT ${value.productList[i].name}");
                                                      value.currProduct = isSearching
                                                          ? value.searchProductList[i]
                                                          : value.productList[i];
                                                    } else {
                                                      isSearching
                                                          ? value.isSearchProductClicked[
                                                              'product$i'] = false
                                                          : value.isProductClicked[
                                                                  'product$i'] =
                                                              false;
                                                    }
                                                  }
                                                });
                                              },
                                              child: ProductCard(
                                                product: isSearching
                                                    ? value.searchProductList[index]
                                                    : value.productList[index],
                                                isClicked: isSearching
                                                    ? (value.isSearchProductClicked[
                                                            'product$index'] ??
                                                        false)
                                                    : (value.isProductClicked[
                                                            'product$index'] ??
                                                        false),
                                              ),
                                            );
                                          },
                                        ),
                                if (value.isFacilities)
                                  (isSearching && value.searchFacilityList.isEmpty)
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
                                              ? value.searchFacilityList.length
                                              : value.facilityList.length,
                                          physics: BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  for (int i = 0;
                                                      isSearching
                                                          ? i <
                                                          value.searchFacilityList
                                                                  .length
                                                          : i <
                                                          value.facilityList.length;
                                                      i++) {
                                                    if (i == index) {
                                                      isSearching
                                                          ? (value.isSearchFacilityClicked[
                                                                  'facility$i'] =
                                                              true)
                                                          : (value.isFacilityClicked[
                                                                  'facility$i'] =
                                                              true);
                                                      print(
                                                          "#PDCT ${value.facilityList[i].name}");
                                                      value.currFacility = isSearching
                                                          ? value.searchFacilityList[i]
                                                          : value.facilityList[i];
                                                    } else {
                                                      isSearching
                                                          ? (value.isSearchFacilityClicked[
                                                                  'facility$i'] =
                                                              false)
                                                          : (value.isFacilityClicked[
                                                                  'facility$i'] =
                                                              false);
                                                    }
                                                  }
                                                });
                                              },
                                              child: FacilityCard(
                                                facility: isSearching
                                                    ? value.searchFacilityList[index]
                                                    : value.facilityList[index],
                                                isClicked: isSearching
                                                    ? (value.isSearchFacilityClicked[
                                                            'facility$index'] ??
                                                        false)
                                                    : (value.isFacilityClicked[
                                                            'facility$index'] ??
                                                        false),
                                              ),
                                            );
                                          },
                                        ),
                                if (value.isClients)
                                  (isSearching && value.searchClientsList.isEmpty)
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
                                              ? value.searchClientsList.length
                                              : value.clientList.length,
                                          physics: BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  for (int i = 0;
                                                      isSearching
                                                          ? i <value.searchClientsList.length
                                                          : i < value.clientList.length;
                                                      i++) {
                                                    if (i == index) {
                                                      isSearching
                                                          ? value.isSearchClientClicked[
                                                              'client$i'] = true
                                                          : value.isClientClicked[
                                                              'client$i'] = true;

                                                      value.currClient = isSearching
                                                          ? value.searchClientsList[i]
                                                          : value.clientList[i];
                                                    } else {
                                                      isSearching
                                                          ? value.isSearchClientClicked[
                                                              'client$i'] = false
                                                          : value.isClientClicked[
                                                              'client$i'] = false;
                                                    }
                                                  }
                                                  value.callback();

                                                });
                                              },
                                              child: ClientCard(
                                                client: isSearching
                                                    ? value.searchClientsList[index]
                                                    : value.clientList[index],
                                                isClicked: isSearching
                                                    ? (value.isSearchClientClicked[
                                                            'client$index'] ??
                                                        false)
                                                    : (value.isClientClicked[
                                                            'client$index'] ??
                                                        false), id: "client$index"
                                              ),
                                            );
                                          },
                                        ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: mq.width * 0.007,
                ),
                Expanded(
                  child: Column(
                    children: [
                      if (!value.isInfo)
                        Padding(
                          padding: EdgeInsets.only(
                              right: mq.width * 0.007, bottom: mq.width * 0.007),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.white24,
                                      )),
                                  width: 200,
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (value.isProducts)
                                        Expanded(
                                          child: Container(
                                              width: 250,
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  value.currProduct!.name,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: AppColors.theme[
                                                          'secondaryColor']),
                                                ),
                                              )),
                                        ),
                                      if (value.isFacilities)
                                        Expanded(
                                          child: Container(
                                              width: 250,
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  value.currFacility!.name,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: AppColors.theme[
                                                          'secondaryColor']),
                                                ),
                                              )),
                                        ),
                                      if (value.isClients)
                                        Expanded(
                                          child: Container(
                                              width: 250,
                                              height: 50,
                                              child: Center(
                                                child: Text(
                                                  value.currClient!.name,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: AppColors.theme[
                                                          'secondaryColor']),
                                                ),
                                              )),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: mq.width * 0.007),
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
                                    padding: EdgeInsets.all(13.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Rename",
                                          style: TextStyle(
                                            color:
                                                AppColors.theme['secondaryColor'],
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
                                  if (value.isDirector && value.isInfo) DirectorInfoDesktop(),
                                  if (value.isAbout && value.isInfo) AboutDesktop(),
                                  if (value.isContact && value.isInfo)
                                    ContactDetailsDesktop(),
                                  if (value.isProducts)
                                    ProductDetailDesktop(
                                      product: value.currProduct!,
                                    ),
                                  if (value.isFacilities)
                                    FacilityDetailDesktop(
                                      facility: value.currFacility!,
                                    ),
                                  if (value.isClients)
                                    ClientsDetailDesktop(
                                      client: value.currClient!,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
      },
    );
  }
}
