import 'package:flutter/material.dart' ;

import '../../main.dart';
import '../colors.dart';

class LoginTextField extends StatefulWidget {
  final bool isMobile;
  final IconData icon ;
  final String hintText ;
  final bool isPassword ;
  final  bool isEmail ;
  final TextEditingController controller ;
  const LoginTextField({super.key, required this.icon, required this.hintText, required this.isPassword, required this.isEmail, required this.isMobile, required this.controller});

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    mq  = MediaQuery.of(context).size ;
    return Container(
      constraints: BoxConstraints(
        minHeight: widget.isMobile? 50 : 60,
        minWidth:  widget.isMobile? 400.0 : 100,
      ),
      height: widget.isMobile? mq.width / 8 : mq.height*0.07,
      width: widget.isMobile ? mq.width / 1.25:mq.width*0.3,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: mq.width / 30),
      decoration: BoxDecoration(
        color: AppColors.theme['primaryColor'],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        textAlign: !widget.isMobile ? TextAlign.center : TextAlign.start,
        style: TextStyle(
          color: AppColors.theme['secondaryColor'],
        ),
        obscureText: widget.isPassword,
        keyboardType: widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: AppColors.theme['secondaryColor'],
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color:AppColors.theme['secondaryColor'],
          ),
        ),
      ),
    );
  }
}
