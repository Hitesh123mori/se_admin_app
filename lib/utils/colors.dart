import 'package:flutter/material.dart';

hexStringToColors(String hexColor){
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }

  return Color(int.parse(hexColor, radix: 16));
}


class AppColors {
  static Map theme = themes["theme1"];

  static Map themes = {
    "theme1": {
      "primaryColor":hexStringToColors("#14181a"),
      "secondaryColor" :hexStringToColors("#fbf4f1"),
      "tertiaryColor":hexStringToColors("#a7a6a6a"),
      "highlightColor" :hexStringToColors("#d9ae00"),
    },

  };


}