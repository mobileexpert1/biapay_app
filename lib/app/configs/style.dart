import 'dart:ui';

import 'package:flutter/material.dart';

import 'const.dart';

mixin Style {
  //app bar text
  static TextStyle appBarStyle = const TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w700,
    color: AppColors.colorBlueDark,
    fontStyle: FontStyle.normal,
  );

  //language selection text style
  static TextStyle languageStyle = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w300,
    color: AppColors.colorBlack,
    fontStyle: FontStyle.normal,
  );

  //language selection hint  text style
  static TextStyle languageHintStyle = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w300,
    color: AppColors.colorBlueDark,
    fontStyle: FontStyle.normal,
  );

  //middle sign in text style
  static TextStyle signInStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.colorWhite,
    fontStyle: FontStyle.normal,
  );

  //user name hint style
  static TextStyle hintStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: Colors.white54,
    fontStyle: FontStyle.normal,
  );

  //user name style
  static TextStyle userStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontStyle: FontStyle.normal,
  );

  //terms and condition style
  static TextStyle tnCStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontStyle: FontStyle.normal,
  );

  //next button text style
  static TextStyle nextButtonStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.colorBlueDark,
    fontStyle: FontStyle.normal,
  );

  //next button text style
  static TextStyle nextButtonWhiteStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.colorWhite,
    fontStyle: FontStyle.normal,
  );

  //create account text
  static TextStyle createStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.colorWhite,
    fontStyle: FontStyle.normal,
  );

  //style for splash text
  static TextStyle splashTextStyle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w700,
    color: AppColors.colorWhite,
    fontStyle: FontStyle.normal,
  );

  //style for side menu text
  static TextStyle drawerTextStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColors.colorWhite,
    fontStyle: FontStyle.normal,
  );

  //style for side menu text
  static TextStyle gridTextStyle = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w300,
    color: AppColors.colorBlueDark,
    fontStyle: FontStyle.normal,
  );

  //style for user type radio text
  static TextStyle userTypeTextStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.colorBlack,
    fontStyle: FontStyle.normal,
  );

  //style for drawer dialog type text
  static TextStyle bmfContentStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: Colors.grey,
    fontStyle: FontStyle.normal,
  );

  //style for drawer dialog type text
  static TextStyle bmfContentValueStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    fontStyle: FontStyle.normal,
  );

  //style for dialog mf
  static TextStyle bmfButtonTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.blue,
    fontStyle: FontStyle.normal,
  );

  //style for header dialog
  static TextStyle dialogHeaderTextStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.colorBlueDark,
    fontStyle: FontStyle.normal,
  );

  //style for header dialog
  static TextStyle dialogHeaderBmfStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.colorBlack,
    fontStyle: FontStyle.normal,
  );

  //style for home bottom text for tabs
  static TextStyle bottomTextStyle = const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w300,
    color: AppColors.colorBlack,
    fontStyle: FontStyle.normal,
  );

  //style for home switch yellow text
  static TextStyle masterHomeTextStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.yellowAccent,
    fontStyle: FontStyle.normal,
  );

  //style for home switch yellow text
  static TextStyle headerQRTextStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontStyle: FontStyle.normal,
  );
  //style for phone number text
  static TextStyle phoneNumberTextStyle = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontStyle: FontStyle.normal,
  );

  //style for email text
  static TextStyle emailTextStyle = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontStyle: FontStyle.normal,
  );

  //style for enter code text
  static TextStyle enterCodeHeaderTextStyle = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontStyle: FontStyle.normal,
  );

  //style for enter code please text
  static TextStyle enterCodePleaseTextStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: Colors.white,
    fontStyle: FontStyle.normal,
  );

  //style for enter code please text
  static TextStyle headerMerchantTextStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Colors.white,
    fontStyle: FontStyle.normal,
  );

  //style for enter code please text
  static TextStyle selectedTabTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.colorWhite,
    fontStyle: FontStyle.normal,
  );

  //style for enter code please text
  static TextStyle unSelectedTabTextStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: Colors.grey,
    fontStyle: FontStyle.normal,
  );

  //style for appbar
  static TextStyle appbarStyle = const TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontStyle: FontStyle.normal,
  );
}
