import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color blueColor = Color(0xFF4e5ae8);
const Color yellowColor = Color(0xFFffb746);
const Color pinkColor = Color(0xFFff4667);
const Color whiteColor = Colors.white;
const Color darkGreyColor = Color(0xFF121212);
const Color darkHeaderColor = Color(0xFF424242);
const Color primaryColor = blueColor;

class Themes {
  static final light = ThemeData(
    backgroundColor: whiteColor,
    primaryColor: blueColor,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    backgroundColor: darkGreyColor,
    primaryColor: pinkColor,
    brightness: Brightness.dark,
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
    ),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
    ),
  );
}
