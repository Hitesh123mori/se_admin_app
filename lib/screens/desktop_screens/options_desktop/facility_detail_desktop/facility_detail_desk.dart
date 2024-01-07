import 'package:flutter/material.dart' ;
import 'package:se_admin_app/models/facility.dart';

class FacilityDetailDesktop extends StatefulWidget {
  final Facility facility ;
  const FacilityDetailDesktop({super.key, required this.facility});

  @override
  State<FacilityDetailDesktop> createState() => _FacilityDetailDesktopState();
}

class _FacilityDetailDesktopState extends State<FacilityDetailDesktop> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(widget.facility.name,style: TextStyle(color: Colors.white,fontSize: 16),),
      ),
    );
  }
}
