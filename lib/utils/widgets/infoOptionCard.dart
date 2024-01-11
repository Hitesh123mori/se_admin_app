import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/InfoProvider.dart';
import 'package:se_admin_app/utils/colors.dart';

class InfoOptionsCard extends StatefulWidget {
  final String optionName;

  InfoOptionsCard({Key? key, required this.optionName})
      : super(key: key);

  @override
  State<InfoOptionsCard> createState() => _InfoOptionsCardState();
}

class _InfoOptionsCardState extends State<InfoOptionsCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoProvider>(builder: (context, infoOp, child){

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
              infoOp.updateCurrent(widget.optionName);
            });
          },
          child: Container(
            height: 55,
            color: isHover ? Colors.white10 : Colors.transparent,
            child: Row(
              children: [
                if (infoOp.options[widget.optionName]??false)
                  Container(
                    height: 30,
                    width: 5,
                    color: AppColors.theme['highlightColor'],
                  ),
                SizedBox(width: 10,),
                Text(
                  widget.optionName,
                  style: TextStyle(color: AppColors.theme['secondaryColor'], fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      );

    });

  }
}
