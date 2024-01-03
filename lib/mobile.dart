import 'package:flutter/material.dart' ;
import 'package:se_admin_app/screens/mobile_screens/login_mobile.dart';
import 'package:se_admin_app/screens/mobile_screens/splash_screen_mobile.dart';

class Mobile extends StatefulWidget {
  const Mobile({super.key});

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home:SplashScreenMobile(),
    );
  }
}
