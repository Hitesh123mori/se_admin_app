import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/FacilityProvider.dart';
import 'package:se_admin_app/models/facility.dart';

import '../colors.dart';

class FacilityCard extends StatefulWidget {
  final Facility facility ;
  bool isClicked = false;
  FacilityCard({super.key, required this.facility, required  this.isClicked});

  @override
  State<FacilityCard> createState() => _FacilityCardState();
}

class _FacilityCardState extends State<FacilityCard> {

  bool isHover = false ;

  @override
  Widget build(BuildContext context) {
    print("#click${widget.isClicked}");
    return Consumer<FacilityProvider>(builder: (context, facilityPro, child){
      return MouseRegion(
        onEnter: (_) {
          setState(() {
            isHover = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHover = false;
          });
        },
        child: InkWell(
          onTap: (){
            setState(() {
              facilityPro.updateCurrent(widget.facility);
              print("enter") ;
            });
          },
          child: Container(
            height: 55,
            color: isHover ? Colors.white10 : Colors.transparent,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  if (widget.isClicked)
                    Container(
                      height: 30,
                      width: 5,
                      color: AppColors.theme['highlightColor'],
                    ),
                  SizedBox(width: 10,),
                  Text(
                    widget.facility.name,
                    style: TextStyle(color: AppColors.theme['secondaryColor'], fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

    });

  }
}
