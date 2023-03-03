import 'package:flutter/material.dart';

class ColorPalette {

  static final ColorPalette _singleton = ColorPalette._internal();

  factory ColorPalette() {
    return _singleton;
  }

  ColorPalette._internal();

  static const Color primary = Color(0xFFDF2E38);
  static const Color secondary = Color(0xFFDF2E38);
  static const Color pinkShade = Color(0xFFF5D4E0);
  static const Color pinkButtonBackground = Color(0xFFFFDFEB);
  static const Color pinkShade1 = Color(0xFFF69197);
  static const Color blue1 = Color(0xff2D3B72);
  static const Color blueLight = Color(0xFFC7D2E2);
  static const Color whiteBackground = Color(0xFFFAFAFA);
  static const Color whiteBackground2 = Color(0xFFF2F2F2);
  static const Color textGrey = Color(0xFF8D91A2);
  static const Color textGrey2 = Color(0xFFA7A7A7);
  static const Color greyBackground = Color(0xffEAEAEA);
  static const Color greyBackground2 = Color(0xffD9D9D9);
  static const Color greyText = Color(0xFF8492A2);
  static const Color greyText2 = Color(0xFF8D8D8D);
  static const Color green = Color(0xFF79CA00);
  static const Color yellow = Color(0xFFFFAC30);
  static const Color orange = Color(0xfff44336);
  static const Color red = Color(0xFFdc1616);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFBDBDBD);
  static const Color black = Color(0xFF000000);
  static const Color purple   = Color(0XFFD6A4EE); 
  static const Color gradint1 = Color(0xff6A35FF);
  static const Color gradint2 = Color(0xffEB577B);
  static const Color gradint3 = Color(0xffEB577B);
  static const Color gradint4 = Color(0xFFFFA5AD);
  static const Color gradint5 = Color(0xFFFFECF3);
  static const Color blackText = Color(0xFF333333);
  static const Color blackText2 = Color(0xFF6A6A6A);
  static const Color blackTextTitle = Color(0xFF525252);
  static const Color dividerBottomSheet = Color(0xFFF298A9);
  static const Color dividerBottomSheet2 = Color(0xFFF2F2F2);
  static const Color purpleBorder = Color(0xFF9D7AFF);
  static const Color yellowBorder = Color(0xFFFC9A3F);
  static const Color whiteBorder = Color(0xFFEFEFEF);
  static const Color greyBorder = Color(0xFFD9D9D9);

  static const Color grey200 = Color.fromARGB(50, 50, 50, 0);
  
}