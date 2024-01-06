import 'package:flutter/material.dart';


import 'package:se_admin_app/apis/content/content.dart';

class HomeScreenDesktop extends StatefulWidget {
  const HomeScreenDesktop({super.key});

  @override
  State<HomeScreenDesktop> createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop> {
  late TextEditingController introduction_tec;

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Container(
        child: FutureBuilder(
          future: Content.getContent("content", "home"),
          builder: (context, snap) {
            introduction_tec = new TextEditingController(text: snap.data?["intro"]??"Loading...");
            return TextField(
              controller: introduction_tec,);
          },
        ),
      ),

    );
  }
}
