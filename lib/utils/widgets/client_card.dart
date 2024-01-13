import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/KClientProvider.dart';
import 'package:se_admin_app/constant/constants_provider.dart';


import '../../models/client.dart';
import '../colors.dart';

class ClientCard extends StatefulWidget {
  final KClient client ;
  bool isClicked = false ;
  ClientCard({super.key, required this.client,required this.isClicked});

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
                kClient.updateCurrent(widget.client);
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
                      widget.client.name,
                      style: TextStyle(color: AppColors.theme['secondaryColor'], fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

      },
    );

  }
}
