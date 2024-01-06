import 'package:flutter/material.dart';
import 'package:se_admin_app/utils/colors.dart';

class Options extends StatefulWidget {
  final String optionName;
  bool isClicked;

  Options({Key? key, required this.optionName, required this.isClicked})
      : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  bool isHover = false;

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
              widget.optionName,
              style: TextStyle(color: AppColors.theme['secondaryColor'], fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
