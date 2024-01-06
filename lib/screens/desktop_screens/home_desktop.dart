import 'package:flutter/material.dart';
import '../../main.dart';
import '../../utils/colors.dart';
import '../../utils/widgets/options.dart';
import 'options_desktop/basic_info_desktop.dart';
import 'options_desktop/facility_desktop.dart';
import 'options_desktop/key_clients.dart';
import 'options_desktop/products_desktop.dart';

class HomeScreenDesktop extends StatefulWidget {
  const HomeScreenDesktop({super.key});

  @override
  State<HomeScreenDesktop> createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop> {
  late TextEditingController introduction_tec;

  bool isClicked1 = false;
  bool isClicked2 = false;
  bool isClicked3 = false;
  bool isClicked4 = false;

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
                    )),
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
                          child: Text(
                            "Open Website",
                            style: TextStyle(
                                color: AppColors.theme['secondaryColor'],
                                fontSize: 16),
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
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              isClicked2 = false;
                              isClicked3 = false;
                              isClicked4 = false;
                              isClicked1  = true ;
                            });
                          },
                            child: Options(
                          optionName: 'Basic information',
                          isClicked: isClicked1,
                        )),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: (){
                              setState(() {
                                isClicked1 = false;
                                isClicked3 = false;
                                isClicked4 = false;
                                isClicked2  = true ;

                              });
                            },
                            child: Options(
                              optionName: 'Products',
                              isClicked: isClicked2,
                            )),
                        InkWell(
                            onTap: (){
                              setState(() {
                                isClicked1 = false;
                                isClicked2 = false;
                                isClicked4 = false;
                                isClicked3  = true ;
                              });
                            },
                            child: Options(
                              optionName: 'Facilities',
                              isClicked: isClicked3,
                            )),
                        InkWell(
                            onTap: (){
                              setState(() {
                                isClicked1 = false;
                                isClicked3 = false;
                                isClicked2 = false;
                                isClicked4  = true ;
                              });
                            },
                            child: Options(
                              optionName: 'Key Clients',
                              isClicked: isClicked4,
                            )),
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: AppColors.theme['tertiaryColor'],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white24,
                    )),
                constraints: BoxConstraints(
                  minWidth: 250,
                ),
                height: mq.height * 1,
                width: mq.width * 0.2,
              ),
              SizedBox(width: mq.width * 0.007),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: mq.width * 0.007),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.theme['tertiaryColor'],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white24,
                        )),
                    height: mq.height * 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if(isClicked1)
                          BasicInfoDesktop() ,

                        if(isClicked2)
                          ProductsDesktop() ,

                        if(isClicked3)
                           FacilityDesktop() ,

                        if(isClicked4)
                          KClientsDesktop() ,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // return Scaffold(
    //
    //   body: Container(
    //     child: FutureBuilder(
    //       future: Content.getContent("content", "home"),
    //       builder: (context, snap) {
    //         introduction_tec = new TextEditingController(text: snap.data?["intro"]??"Loading...");
    //         return TextField(
    //           controller: introduction_tec,);
    //       },
    //     ),
    //   ),
    //
    // );
  }
}
