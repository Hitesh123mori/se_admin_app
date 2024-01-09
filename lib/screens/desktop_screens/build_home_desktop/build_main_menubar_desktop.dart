import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/constant/constants_provider.dart';

import '../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/widgets/options.dart';

class MainMenubarDesktop extends StatefulWidget {
  MainMenubarDesktop({
    super.key,
  });

  @override
  State<MainMenubarDesktop> createState() => _MainMenubarDesktopState();
}

class _MainMenubarDesktopState extends State<MainMenubarDesktop> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ConstantsProvider>(builder: (build, value, child) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      value.isFacilities = false;
                      value.isClients = false;
                      value.isProducts = false;
                      value.isInfo = true;
                      value.callback() ;
                    });
                  },
                  child: Options(
                    optionName: 'Basic information',
                    isClicked: value.isInfo,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      value.isFacilities = false;
                      value.isClients = false;
                      value.isProducts = true;
                      value.isInfo = false;
                      value.callback() ;
                    });
                  },
                  child: Options(
                    optionName: 'Products',
                    isClicked: value.isProducts,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      value.isFacilities = true;
                      value.isClients = false;
                      value.isProducts = false;
                      value.isInfo = false;
                      value.callback() ;
                    });
                  },
                  child: Options(
                    optionName: 'Facilities',
                    isClicked: value.isFacilities,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      value.isFacilities = false;
                      value.isClients = true;
                      value.isProducts = false;
                      value.isInfo = false;
                      value.callback() ;
                    });
                  },
                  child: Options(
                    optionName: 'Key Clients',
                    isClicked: value.isClients,
                  ),
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: AppColors.theme['tertiaryColor'],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white24,
          ),
        ),
        constraints: BoxConstraints(
          minWidth: 190,
        ),
        height: mq.height * 1,
        width: mq.width * 0.1,
      );
    });
  }
}
