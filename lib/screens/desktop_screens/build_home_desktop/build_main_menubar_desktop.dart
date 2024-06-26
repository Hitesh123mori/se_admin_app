import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/MainOptionProvider.dart';

import '../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/widgets/options.dart';

class MainMenuBarDesktop extends StatefulWidget {
  const MainMenuBarDesktop({
    super.key,
  });

  @override
  State<MainMenuBarDesktop> createState() => _MainMenuBarDesktopState();
}

class _MainMenuBarDesktopState extends State<MainMenuBarDesktop> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainOptionProvider>(builder: (build, mainOp, child) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.theme['tertiaryColor'],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white24,
          ),
        ),
        constraints: const BoxConstraints(
          minWidth: 190,
        ),
        height: mq.height * 1,
        width: mq.width * 0.1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: mainOp.mainOptions.keys.toList().map((e) => Options(optionName: e)).toList()
            ),
          ),
        ),
      );
    });
  }
}
