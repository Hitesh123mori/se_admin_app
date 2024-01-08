import 'package:flutter/material.dart';

class DirectorInfoDesktop extends StatefulWidget {
  const DirectorInfoDesktop({super.key});

  @override
  State<DirectorInfoDesktop> createState() => _DirectorInfoDesktopState();
}

class _DirectorInfoDesktopState extends State<DirectorInfoDesktop> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Director Information",style: TextStyle(color: Colors.white,fontSize: 16),),
      ),
    );
  }
}
