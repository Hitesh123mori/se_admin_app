import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_admin_app/Providers/InfoProvider.dart';

import 'package:se_admin_app/main.dart';
import 'package:se_admin_app/utils/colors.dart';
import 'package:se_admin_app/utils/widgets/infoOptionCard.dart';

class InfoOptionsCol extends StatefulWidget {
  const InfoOptionsCol({super.key});

  @override
  State<InfoOptionsCol> createState() => _InfoOptionsColState();
}

class _InfoOptionsColState extends State<InfoOptionsCol> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InfoProvider>(builder: (context, infoOp, child){
      return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.theme['tertiaryColor'],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white24,
              ),
            ),
            constraints: const BoxConstraints(minWidth: 250,),
            width: mq.width * 0.15,
            height: mq.height * 1,

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: infoOp.options.keys.map((e) => InfoOptionsCard(optionName: e)).toList(),
                ),
              ),
            ),
          )
      );
    });
  }
}
