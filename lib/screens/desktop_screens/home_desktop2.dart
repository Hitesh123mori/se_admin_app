import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/MainOptionProvider.dart';
import 'package:se_admin_app/models/client.dart';
import 'package:se_admin_app/models/facility.dart';
import 'package:se_admin_app/models/product.dart';
import 'package:se_admin_app/screens/desktop_screens/build_home_desktop/FacilityOptionsCol.dart';
import 'package:se_admin_app/screens/desktop_screens/build_home_desktop/KClientOptionsCol.dart';
import 'package:se_admin_app/screens/desktop_screens/build_home_desktop/infoOptionsCol.dart';
import 'package:se_admin_app/screens/desktop_screens/build_home_desktop/productOptionsCol.dart';
import '../../Providers/FacilityProvider.dart';
import '../../Providers/InfoProvider.dart';
import '../../Providers/KClientProvider.dart';
import '../../Providers/ProductProvider.dart';
import '../../main.dart';
import '../../utils/colors.dart';
import 'package:se_admin_app/screens/desktop_screens/build_home_desktop/appbar_desktop.dart';
import 'package:se_admin_app/screens/desktop_screens/build_home_desktop/build_main_menubar_desktop.dart';

import 'options_desktop/basic_info_options_desktop/about_us_desktop.dart';
import 'options_desktop/basic_info_options_desktop/contact_details_desktop.dart';
import 'options_desktop/basic_info_options_desktop/director_info_desktop.dart';
import 'options_desktop/facility_detail_desktop/facility_detail_desk.dart';
import 'options_desktop/key_clients_desktop/key_clients_desk.dart';
import 'options_desktop/product_detail_desk/product_details_desktop.dart';

class HomeScreenDesktop2 extends StatefulWidget {
  const HomeScreenDesktop2({super.key});

  @override
  State<HomeScreenDesktop2> createState() => _HomeScreenDesktop2State();
}

class _HomeScreenDesktop2State extends State<HomeScreenDesktop2> {


  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Consumer5<MainOptionProvider, FacilityProvider, InfoProvider, KClientProvider, ProductProvider>(
      builder: (context, mainOp, facilityPro, infoPro, clientPro, productPro, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: AppColors.theme['primaryColor'],
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(150.0),
              child: AppbarDesktop(),
            ),
            body: Padding(
              padding: EdgeInsets.only(left: mq.width * 0.007, bottom: 10),
              child: Row(
                children: [
                  const MainMenuBarDesktop(),
                  SizedBox(width: mq.width * 0.007),
                  if (mainOp.current == "Primary Information") const InfoOptionsCol(),
                  if (mainOp.current == "Products") const ProductOptionsCol(),
                  if (mainOp.current == "Facilities") const FacilityOptionsCol(),
                  if (mainOp.current == "Clients") const KClientOptionsCol(),
                  SizedBox(width: mq.width * 0.007,),
                  // Expanded(
                  //   child: Column(
                  //     children: [
                  //       if (mainOp.current != "Primary Information")
                  //         Padding(
                  //           padding: EdgeInsets.only(
                  //               right: mq.width * 0.007, bottom: mq.width * 0.007),
                  //           child: Row(
                  //             children: [
                  //               Expanded(
                  //                 child: Container(
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(10),
                  //                     border: Border.all(
                  //                       color: Colors.white24,
                  //                     ),
                  //                   ),
                  //                   width: 200,
                  //                   height: 50,
                  //                   child: Row(
                  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                     children: [
                  //                       if (mainOp.current == "Products")
                  //                         Expanded(
                  //                           child: Container(
                  //                             width: 250,
                  //                             height: 50,
                  //                             child: Center(
                  //                               child: Text(
                  //                                 productPro.current?.name ?? '',
                  //                                 style: TextStyle(
                  //                                     fontSize: 16,
                  //                                     color: AppColors.theme['secondaryColor']),
                  //                               ),
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       if (mainOp.current == "Facilities")
                  //                         Expanded(
                  //                           child: Container(
                  //                             width: 250,
                  //                             height: 50,
                  //                             child: Center(
                  //                               child: Text(
                  //                                 facilityPro.current?.name ?? '',
                  //                                 style: TextStyle(
                  //                                     fontSize: 16,
                  //                                     color: AppColors.theme['secondaryColor']),
                  //                               ),
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       if (mainOp.current == "Clients")
                  //                         Expanded(
                  //                           child: Container(
                  //                             width: 250,
                  //                             height: 50,
                  //                             child: Center(
                  //                               child: Text(
                  //                                 clientPro.current?.name ?? '',
                  //                                 style: TextStyle(
                  //                                     fontSize: 16,
                  //                                     color: AppColors.theme['secondaryColor']),
                  //                               ),
                  //                             ),
                  //                           ),
                  //                         ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //               Padding(
                  //                 padding: EdgeInsets.only(left: mq.width * 0.007),
                  //                 child: ElevatedButton(
                  //                   onPressed: () {},
                  //                   style: ElevatedButton.styleFrom(
                  //                     shape: RoundedRectangleBorder(
                  //                       borderRadius: BorderRadius.circular(10.0),
                  //                       side: BorderSide(color: Colors.white24),
                  //                     ),
                  //                     primary: AppColors.theme['primaryColor'],
                  //                   ),
                  //                   child: Padding(
                  //                     padding: EdgeInsets.all(13.0),
                  //                     child: Row(
                  //                       children: [
                  //                         Text(
                  //                           "Rename",
                  //                           style: TextStyle(
                  //                             color: AppColors.theme['secondaryColor'],
                  //                             fontSize: 16,
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       Expanded(
                  //         child: Padding(
                  //           padding: EdgeInsets.only(right: mq.width * 0.007),
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               color: AppColors.theme['tertiaryColor'],
                  //               borderRadius: BorderRadius.circular(10),
                  //               border: Border.all(
                  //                 color: Colors.white24,
                  //               ),
                  //             ),
                  //             height: mq.height * 1,
                  //             child: SingleChildScrollView(
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   if (infoPro.current == "Director Information" && mainOp.current == "Primary Information") DirectorInfoDesktop(),
                  //                   if (infoPro.current == "About Us" && mainOp.current == "Primary Information") AboutDesktop(),
                  //                   if (infoPro.current == "Contact Us" && mainOp.current == "Primary Information") ContactDetailsDesktop(),
                  //                   if (mainOp.current == "Products")
                  //                     ProductDetailDesktop(
                  //                       // product: productPro.current ?? Product(name: '', imagePath: ''),
                  //                     ),
                  //                   if (mainOp.current == "Facilities")
                  //                     FacilityDetailDesktop(
                  //                       facility: facilityPro.current ?? Facility(name: '', imagePath: '', discription: ''),
                  //                     ),
                  //                   if (mainOp.current == "Clients")
                  //                     ClientsDetailDesktop(
                  //                       client: clientPro.current ?? KClient(name: '', imagePath: ''),
                  //                     ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )

                  if (mainOp.current == "Primary Information") const DirectorInfoDesktop(),
                  if (mainOp.current == "Products") const ProductDetailDesktop(),
                  if (mainOp.current == "Facilities") const FacilityDetailDesktop(),
                  if (mainOp.current == "Clients") ClientsDetailDesktop(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


