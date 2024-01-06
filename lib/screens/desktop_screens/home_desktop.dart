import 'package:flutter/material.dart';


import 'package:se_admin_app/apis/content/content.dart';

import '../../main.dart';
import '../../utils/colors.dart';

class HomeScreenDesktop extends StatefulWidget {
  const HomeScreenDesktop({super.key});

  @override
  State<HomeScreenDesktop> createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop> {
  late TextEditingController introduction_tec;

  @override
  Widget build(BuildContext context) {
   mq = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.theme['primaryColor'],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: AppColors.theme['primaryColor'],
            leading: AppBar(
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ) ;


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
