import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin AppTheme {
  static ThemeData data = ThemeData.light().copyWith(
    canvasColor: Colors.white,
    // textTheme: getTextTheme(color: Colors.black),
    primaryTextTheme: ThemeData.light().textTheme.copyWith(
        bodyText1: const TextStyle(fontSize: 22, color: Colors.black)),
    scaffoldBackgroundColor: const Color(0xFF1d2f53),
    primaryColor: const Color(0xFF1d2f53),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
        ),
        textStyle: const TextStyle(fontSize: 19),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    ),
    colorScheme: ThemeData.light()
        .colorScheme
        .copyWith(
            primary: const Color(0xFF1d2f53),
            secondary: const Color(0xFF89ac34),
            error: const Color(0xFFFF1744),
            surface: const Color(0xFF424242),
            background: const Color(0xffffffff))
        .copyWith(secondary: const Color(0xFF89ac34)),
  );
}
