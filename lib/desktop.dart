import 'package:flutter/material.dart' ;
import 'package:se_admin_app/screens/desktop_screens/splash_screen_dekstop.dart';
import 'package:se_admin_app/screens/mobile_screens/login_mobile.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreenDesktop()
    );
  }
}
