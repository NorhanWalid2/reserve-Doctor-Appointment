import 'package:firebase_project/constants/colors.dart';
import 'package:firebase_project/constants/theme.dart';
import 'package:firebase_project/constants/theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: darkTextTheme,
  );

  static final TextTheme darkTextTheme = TextTheme(
    displayLarge: _headline1, //34px
    displayMedium: _headline2, //24px
    displaySmall: _headline3, //18px
    headlineMedium: _headline4, //16px
    headlineSmall: _headline5, //14px
    titleLarge: _headline6, //12px

    titleMedium: _subtitle1, //10px
    // subtitle2: _subtitle2, //13px
    bodyLarge: _bodyText1, //16px
    // bodyText2: _bodyText2, //14px //normal
    // button: _button, //14px
    // caption: _caption, //12px
    // overline: _overline, //10px
  );

  static final TextStyle _headline1 = TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.normal,
    color: AppColors.black,
    fontSize: 34,
  );

  static final TextStyle _headline2 = TextStyle(
    fontFamily: "Roboto",
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  static final TextStyle _headline3 = TextStyle(
    fontFamily: "Roboto",
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static final TextStyle _headline4 = TextStyle(
    fontFamily: "Roboto",
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static final TextStyle _headline5 = TextStyle(
    fontFamily: "Roboto",
    color: AppColors.black,
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );

  static final TextStyle _headline6 = TextStyle(
    fontFamily: "Roboto",
    color: AppColors.black,
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );

  static final TextStyle _subtitle1 = TextStyle(
    fontFamily: "Roboto",
    color: AppColors.black,
    fontWeight: FontWeight.normal,
    fontSize: 10,
  );

  static final TextStyle _bodyText1 = TextStyle(
    fontFamily: "Roboto",
    color: AppColors.grey,
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );

  // static final TextStyle _bodyText2 = TextStyle(
  //   fontFamily: "RedHatDisplay",
  //   color: AppColors.textColor,
  //   fontWeight: FontWeight.w400,
  //   fontSize: 14.sp,
  // );
}

mixin sp {}
