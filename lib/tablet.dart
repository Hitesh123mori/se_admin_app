import 'package:flutter/material.dart' ;
import 'package:se_admin_app/screens/desktop_screens/splash_screen_dekstop.dart';

class Tablet extends StatefulWidget {
  const Tablet({super.key});

  @override
  State<Tablet> createState() => _TabletState();
}

class _TabletState extends State<Tablet> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold()
    );
  }
}
