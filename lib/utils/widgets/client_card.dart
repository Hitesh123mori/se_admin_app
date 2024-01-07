import 'package:flutter/material.dart';


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
    );
  }
}
