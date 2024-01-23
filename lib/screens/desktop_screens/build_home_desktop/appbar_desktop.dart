import 'package:flutter/material.dart';
import 'package:se_admin_app/main.dart';
import 'package:se_admin_app/utils/colors.dart';

class AppbarDesktop extends StatefulWidget {
  const AppbarDesktop({super.key});

  @override
  State<AppbarDesktop> createState() => _AppbarDesktopState();
}

class _AppbarDesktopState extends State<AppbarDesktop> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.theme['primaryColor'],
      flexibleSpace: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: mq.width * 0.007, vertical: mq.height * 0.04),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 100,
          ),
          height: mq.height * 0.1,
          width: mq.width * 1,
          decoration: BoxDecoration(
            color: AppColors.theme['tertiaryColor'],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white24,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                child: Image.asset(
                  "assets/images/logos/se_fulllogo.png",
                  fit: BoxFit.cover,
                  width: mq.width * 0.1 > 200.0 ? mq.width * 0.2 : 200.0,
                  height: mq.height * 0.1 > 200.0 ? mq.height * 0.2 : 200.0,
                ),
              ),
              Text(
                'Admin Panel',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.theme['secondaryColor'],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 26.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.theme['tertiaryColor'],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.white24),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "L O G O U T",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
