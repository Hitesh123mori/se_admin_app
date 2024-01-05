import 'package:flutter/material.dart';

import 'package:se_admin_app/utils/widgets/MyText.dart';

import 'package:se_admin_app/apis/content/content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
