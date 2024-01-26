import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:se_admin_app/apis/Authanticantion.dart';
import 'package:se_admin_app/utils/colors.dart';
import 'package:se_admin_app/main.dart';
import 'package:se_admin_app/utils/widgets/login_textfield.dart';
import 'home_desktop2.dart';

class LoginScreenDesktop extends StatefulWidget {
  const LoginScreenDesktop({super.key});

  @override
  State<LoginScreenDesktop> createState() => _LoginScreenDesktopState();
}

class _LoginScreenDesktopState extends State<LoginScreenDesktop> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool visible = false;
  var temp;


  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      home: Scaffold(
        backgroundColor: AppColors.theme['primaryColor'],
        body: Center(
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 500.0,
              minWidth: 400.0,
            ),
            height: mq.height * 0.6,
            width: mq.width * 0.3,
            decoration: BoxDecoration(
              border: Border.all(
                color:  Colors.white24
              ),
              color: AppColors.theme['tertiaryColor'],
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: mq.width * 0.03),
                child: Column(
                  children: [
                    SizedBox(
                      height: mq.height * 0.05,
                    ),
                    const Image(
                      image: AssetImage("assets/images/logos/se_logo.png"),
                      height: 100,
                      width: 100,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: mq.width * .04,
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
                      icon: Icons.phone,
                      hintText: 'Phone number',
                      isPassword: false,
                      isEmail: true,
                      isMobile: false,
                      controller: _phoneController,
                    ),
                    SizedBox(
                      height: mq.height * 0.02,
                    ),
                    visible ?LoginTextField(
                      icon: Icons.password,
                      hintText: 'OTP',
                      isPassword: true,
                      isEmail: false,
                      isMobile: false,
                      controller: _otpController,
                    ) : Container(),
                    SizedBox(
                      height: mq.height * 0.02,
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if(!visible){
                          try{
                            temp = await FirebaseAuthentication().sendOTP(_phoneController.text);
                            // print("#res: $temp");
                            setState(() {visible = !visible;});
                            Fluttertoast.showToast(
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 5,
                              msg: "OTP Sent to +91 ${_phoneController.text}",
                              webShowClose: true,
                              webBgColor: "#14181a",
                              backgroundColor: Colors.black,
                              gravity: ToastGravity.BOTTOM_RIGHT,
                            );
                          }
                          on FirebaseAuthException catch (e){
                            Fluttertoast.showToast(
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 5,
                              msg: "Invalid phone number. Please try again.",
                              webShowClose: true,
                              webBgColor: "#14181a",
                              backgroundColor: Colors.black,
                              gravity: ToastGravity.BOTTOM_RIGHT,
                            );
                          }

                        }
                        else{
                          bool isAuth = await FirebaseAuthentication().authenticate(temp, _otpController.text);
                          if(isAuth){
                            Fluttertoast.showToast(
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 5,
                              msg: "Authentication successful.",
                              webShowClose: true,
                              webBgColor: "#14181a",
                              backgroundColor: Colors.black,
                              gravity: ToastGravity.BOTTOM_RIGHT,
                            );
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreenDesktop2()));
                          }
                          else{
                            Fluttertoast.showToast(
                              toastLength: Toast.LENGTH_LONG,
                              timeInSecForIosWeb: 5,
                              msg: "Please enter valid OTP",
                              webShowClose: true,
                              webBgColor: "#14181a",
                              backgroundColor: Colors.black,
                              gravity: ToastGravity.BOTTOM_RIGHT,

                            );
                          }
                        }
                      },

                      child: Container(
                        constraints: const BoxConstraints(
                          minHeight: 60,
                          minWidth: 40,
                          maxHeight: 60,
                        ),
                        margin: EdgeInsets.only(
                          bottom: mq.width * .1,
                        ),
                        height: mq.height * 0.07,
                        width: mq.width * 0.3,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.theme['secondaryColor'],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.login),
                            const SizedBox(width: 10,),
                            Text(
                              !visible? 'Send OTP': 'Log In',
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
