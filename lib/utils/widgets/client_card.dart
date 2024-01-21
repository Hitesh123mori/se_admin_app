import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/KClientProvider.dart';
import 'package:se_admin_app/constant/constants_provider.dart';


import '../../models/client.dart';
import '../colors.dart';

class ClientCard extends StatefulWidget {
  final KClient kClient ;
  bool isClicked = false ;
  ClientCard({super.key, required this.kClient,required this.isClicked});

  @override
  State<ClientCard> createState() => _ClientCardState();
}

class _ClientCardState extends State<ClientCard> {

  bool isHover = false ;

  @override
  Widget build(BuildContext context) {
    return Consumer<KClientProvider>(
      builder: (context, kClient, child){
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
                kClient.updateCurrent(widget.kClient);
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
                  SizedBox(width: 10,),

                  SizedBox(
                    width: 190,
                    child: Text(
                      widget.kClient.name,
                      softWrap: true,
                      style: TextStyle(color: AppColors.theme['secondaryColor'], fontSize: 16),
                    ),
                  ),

                  Expanded(child: Container()),

                  if(widget.isClicked)
                    IconButton(
                        onPressed: (){
                          _showDeleteConfirmationDialog(context, widget.kClient, kClient);
                        },
                        icon: Icon(Icons.close_rounded, color: AppColors.theme['secondaryColor']))
                ],
              ),
            ),
          ),
        );

      },
    );

  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context, KClient? kClient, KClientProvider provider) async {
    return showDialog<void>(
      context: context,

      barrierDismissible: false, // Dialog cannot be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 5,
          shadowColor: AppColors.theme["highlightColor"],
          surfaceTintColor: AppColors.theme["highlightColor"],
          backgroundColor: AppColors.theme["tertiaryColor"],
          title: Text('Delete Confirmation', style: TextStyle(color: AppColors.theme['secondaryColor']),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete ${kClient?.name ?? ''}?',
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
                kClient?.delete(provider);
                provider.current = null;
                if(kClient != null) provider.removeFromSearchList(kClient);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Delete', style: TextStyle(color: Colors.redAccent, fontSize: 16),),
            ),
          ],
        );
      },
    );
  }
}
