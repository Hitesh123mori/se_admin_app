import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/MainOptionProvider.dart';
import 'package:se_admin_app/screens/desktop_screens/build_home_desktop/FacilityOptionsCol.dart';
import 'package:se_admin_app/screens/desktop_screens/build_home_desktop/KClientOptionsCol.dart';
import 'package:se_admin_app/screens/desktop_screens/build_home_desktop/infoOptionsCol.dart';
import 'package:se_admin_app/screens/desktop_screens/build_home_desktop/productOptionsCol.dart';
import '../../main.dart';
import '../../utils/colors.dart';
import 'package:se_admin_app/screens/desktop_screens/build_home_desktop/appbar_desktop.dart';
import 'package:se_admin_app/screens/desktop_screens/build_home_desktop/build_main_menubar_desktop.dart';

class HomeScreenDesktop2 extends StatefulWidget {
  const HomeScreenDesktop2({super.key});

  @override
  State<HomeScreenDesktop2> createState() => _HomeScreenDesktop2State();
}

class _HomeScreenDesktop2State extends State<HomeScreenDesktop2> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Consumer<MainOptionProvider>(builder: (context, mainOp, child){

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
                MainMenubarDesktop(),
                SizedBox(width: mq.width * 0.007),


                Column(
                  children: [
                    if (mainOp.current == "info") const InfoOptionsCol(),
                    if(mainOp.current == "products") const ProductOptionsCol(),
                    if(mainOp.current == "clients") const KClientOptionsCol(),
                    if(mainOp.current == "facilities") const FacilityOptionsCol(),
                  ],
                ),


                SizedBox(width: mq.width * 0.007,),

                // Expanded(
                //   child: Column(
                //     children: [
                //       if (!value.isInfo)
                //         Padding(
                //           padding: EdgeInsets.only(
                //               right: mq.width * 0.007, bottom: mq.width * 0.007),
                //           child: Row(
                //             children: [
                //               Expanded(
                //                 child: Container(
                //                   decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(10),
                //                       border: Border.all(
                //                         color: Colors.white24,
                //                       )),
                //                   width: 200,
                //                   height: 50,
                //                   child: Row(
                //                     mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                     children: [
                //                       if (value.isProducts)
                //                         Expanded(
                //                           child: Container(
                //                               width: 250,
                //                               height: 50,
                //                               child: Center(
                //                                 child: Text(
                //                                   value.currProduct!.name,
                //                                   style: TextStyle(
                //                                       fontSize: 16,
                //                                       color: AppColors.theme[
                //                                       'secondaryColor']),
                //                                 ),
                //                               )),
                //                         ),
                //                       if (value.isFacilities)
                //                         Expanded(
                //                           child: Container(
                //                               width: 250,
                //                               height: 50,
                //                               child: Center(
                //                                 child: Text(
                //                                   value.currFacility!.name,
                //                                   style: TextStyle(
                //                                       fontSize: 16,
                //                                       color: AppColors.theme[
                //                                       'secondaryColor']),
                //                                 ),
                //                               )),
                //                         ),
                //                       if (value.isClients)
                //                         Expanded(
                //                           child: Container(
                //                               width: 250,
                //                               height: 50,
                //                               child: Center(
                //                                 child: Text(
                //                                   value.currClient!.name,
                //                                   style: TextStyle(
                //                                       fontSize: 16,
                //                                       color: AppColors.theme[
                //                                       'secondaryColor']),
                //                                 ),
                //                               )),
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
                //                             color:
                //                             AppColors.theme['secondaryColor'],
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
                //                   if (value.isDirector && value.isInfo) DirectorInfoDesktop(),
                //                   if (value.isAbout && value.isInfo) AboutDesktop(),
                //                   if (value.isContact && value.isInfo)
                //                     ContactDetailsDesktop(),
                //                   if (value.isProducts)
                //                     ProductDetailDesktop(
                //                       product: value.currProduct!,
                //                     ),
                //                   if (value.isFacilities)
                //                     FacilityDetailDesktop(
                //                       facility: value.currFacility!,
                //                     ),
                //                   if (value.isClients)
                //                     ClientsDetailDesktop(
                //                       client: value.currClient!,
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

              ],
            ),
          ),
        ),
      );

    });

  }
}

