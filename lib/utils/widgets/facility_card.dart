import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
            child: Row(
              children: [
                if (widget.isClicked)
                  Container(
                    height: 30,
                    width: 5,
                    color: AppColors.theme['highlightColor'],
                  ),
                const SizedBox(width: 10,),
                SizedBox(
                  width: 190,
                  child: Text(
                    widget.facility.name,
                    softWrap: true,
                    style: TextStyle(color: AppColors.theme['secondaryColor'], fontSize: 16),
                  ),
                ),
                Expanded(child: Container()),
                if(widget.isClicked)
                  IconButton(
                      onPressed: (){
                        _showDeleteConfirmationDialog(context, widget.facility, facilityPro);
                      },
                      icon: Icon(Icons.close_rounded,size: 18, color: AppColors.theme['highlightColor']))

              ],
            ),
          ),
        ),
      );

    });

  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context, Facility? facility, FacilityProvider provider) async {
    return showDialog<void>(
      context: context,

      barrierDismissible: false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 5,
          shadowColor: AppColors.theme["tertiaryColor"],
          surfaceTintColor: Colors.black,
          backgroundColor: Colors.black,
          title: Text('Delete Confirmation', style: TextStyle(color: AppColors.theme['secondaryColor']),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete ${facility?.name ?? ''}?',
                  style: TextStyle(color: AppColors.theme['secondaryColor']),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel',style: TextStyle(color: AppColors.theme['secondaryColor']),),
            ),
            TextButton(
              onPressed: () {
                facility?.delete(provider);
                provider.current = null;
                if(facility != null) provider.removeFromSearchList(facility);
                Navigator.of(context).pop(); // Close the dialog
                Fluttertoast.showToast(
                  toastLength: Toast.LENGTH_LONG,
                  timeInSecForIosWeb: 5,
                  msg: "${facility!.name} Deleted",
                  webShowClose: true,
                  webBgColor: "#14181a",
                  backgroundColor: Colors.black,
                  gravity: ToastGravity.BOTTOM_RIGHT,
                );
              },
              child: const Text('Delete', style: TextStyle(color: Colors.redAccent, fontSize: 16),),
            ),
          ],
        );
      },
    );
  }
}
