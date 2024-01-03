import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:se_admin_app/utils/colors.dart';
import '../../main.dart';
import '../../utils/widgets/login_textfield.dart';

class LoginScreenMobile extends StatefulWidget {
  @override
  _LoginScreenMobileState createState() => _LoginScreenMobileState();
}

class _LoginScreenMobileState extends State<LoginScreenMobile> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.theme['tertiaryColor'],
      body: Center(
        child:SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: mq.width*0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: mq.height * 0.1,
                ),
                Image(
                  image: AssetImage("assets/images/logos/se_logo.png"),
                  height: 150,
                  width: 150,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: mq.width * .1,
                  ),
                  child: Text(
                    'Admin Panel',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: AppColors.theme['secondaryColor'],
                    ),
                  ),
                ),
                LoginTextField(
                  icon: Icons.email_outlined,
                  hintText: 'Email',
                  isPassword: false,
                  isEmail: true,
                  isMobile: true,
                  controller: _emailController,
                ),
                SizedBox(
                  height: mq.height * 0.02,
                ),
                LoginTextField(
                  icon: Icons.lock_outline,
                  hintText: 'Password',
                  isPassword: true,
                  isEmail: false,
                  isMobile: true,
                  controller: _passController,
                ),
                SizedBox(
                  height: mq.height * 0.02,
                ),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Set the border radius here
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.login,color: Colors.black,),
                          SizedBox(width: 10),
                          Text(
                            'Log In',
                            style: TextStyle(
                              color: AppColors.theme['primaryColor'],
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.13,
                ),
              ],
            ),
          ),
        ),
          ),
    );
  }

}

