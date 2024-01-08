import 'package:flutter/material.dart';

class AboutDesktop extends StatefulWidget {
  const AboutDesktop({super.key});

  @override
  State<AboutDesktop> createState() => _AboutDesktopState();
}

class _AboutDesktopState extends State<AboutDesktop> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("About us",style: TextStyle(color: Colors.white,fontSize: 16),),
      ),
    );
  }
}
