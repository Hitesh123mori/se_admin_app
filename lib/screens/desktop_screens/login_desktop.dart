import 'package:flutter/material.dart';
import 'package:se_admin_app/utils/colors.dart';
import '../../main.dart';
import '../../utils/widgets/login_textfield.dart';

class LoginScreenDesktop extends StatefulWidget {
  const LoginScreenDesktop({super.key});

  @override
  State<LoginScreenDesktop> createState() => _LoginScreenDesktopState();
}

class _LoginScreenDesktopState extends State<LoginScreenDesktop> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

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
            constraints: BoxConstraints(
              minHeight: 500.0,
              minWidth: 400.0,
            ),
            height: mq.height * 0.6,
            width: mq.width * 0.3,
            decoration: BoxDecoration(
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
                    Image(
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
                      icon: Icons.email_outlined,
                      hintText: 'Email',
                      isPassword: false,
                      isEmail: true,
                      isMobile: false,
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
                      isMobile: false,
                      controller: _passController,
                    ),
                    SizedBox(
                      height: mq.height * 0.02,
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {},
                      child: Container(
                        constraints: BoxConstraints(
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
                            Icon(Icons.login),
                            SizedBox(width: 10,),
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
