import 'package:flutter/material.dart';

abstract class AppColors {
  static const darkBlue = Color(0xFF2B4BF2);
  static const lightBlue = Color(0xFF95A5F8);
  static const grey = Color(0xFF808080);
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const lightGrey = Color(0xFFDFDFDF);
}

abstract class TextStyles {
  static const textBold14 = TextStyle(
      color: AppColors.black, fontSize: 14, fontWeight: FontWeight.bold);
  static const textBold12 = TextStyle(
      color: AppColors.black, fontSize: 12, fontWeight: FontWeight.bold);
  static const text14Grey = TextStyle(color: AppColors.grey, fontSize: 14);
  static const text14White = TextStyle(color: AppColors.white, fontSize: 14);
  static const titleText14 = TextStyle(color: AppColors.black, fontSize: 14);
  static const titleText16 = TextStyle(color: AppColors.black, fontSize: 16);
  static const titleText20 = TextStyle(
      color: AppColors.black, fontSize: 20, fontWeight: FontWeight.bold);
  static const titleText19 = TextStyle(color: AppColors.black, fontSize: 19);
  static const titleText16DarkBlue =
      TextStyle(color: AppColors.darkBlue, fontSize: 16);
}
