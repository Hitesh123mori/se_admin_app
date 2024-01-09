import 'package:flutter/material.dart' ;
import 'package:provider/provider.dart';
import 'package:se_admin_app/screens/desktop_screens/home_desktop.dart';

import '../../../constant/constants_provider.dart';


class ValuePassingDesktop extends StatefulWidget {
  const ValuePassingDesktop({super.key});

  @override
  State<ValuePassingDesktop> createState() => _ValuePassingDesktopState();
}

class _ValuePassingDesktopState extends State<ValuePassingDesktop> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ConstantsProvider>(
        builder: (context, value, child){
          print(value.productList);
          return HomeScreenDesktop(value: value,);
        }
    );
  }
}
