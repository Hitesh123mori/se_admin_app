import 'package:flutter/material.dart' ;

class BasicInfoDesktop extends StatefulWidget {
  const BasicInfoDesktop({super.key});

  @override
  State<BasicInfoDesktop> createState() => _BasicInfoDesktopState();
}

class _BasicInfoDesktopState extends State<BasicInfoDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Basic Information",style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
    );
  }
}
