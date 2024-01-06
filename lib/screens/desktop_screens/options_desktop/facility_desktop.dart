import 'package:flutter/material.dart' ;

class FacilityDesktop extends StatefulWidget {
  const FacilityDesktop({super.key});

  @override
  State<FacilityDesktop> createState() => _FacilityDesktopState();
}

class _FacilityDesktopState extends State<FacilityDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Facilities",style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
    );
  }
}
