import 'dart:math';

import 'package:flutter/material.dart';

import 'color.dart';

class BaseColors {
  static Color color1 = Color(0xfff8f9fa); //  #f8f9fa
  static Color color2 = Color(0xffe9ecef); //  #e9ecef
  static Color color3 = Color(0xffdee2e6); //  #dee2e6
  static Color color4 = Color(0xffced4da); //  #ced4da
  static Color color5 = Color(0xffadb5bd); //  #adb5bd
  static Color color6 = Color(0xff6c757d); //  #6c757d
  static Color color7 = Color(0xff495057); //  #495057
  static Color color8 = Color(0xff495057); //  #495057
  static Color color9 = Color(0xff343a40); //  #343a40
  static Color color10 = Color(0xff212529); //  #212529

  static Color get oneRandomColor {
    final List<Color> array = [
      Color(0xffC5B7FD),
      Color(0xffB5FFC6),
      Color(0xffFFD191),
      Color(0xffC0CDE7),
      Color(0xff68D5FB),
      Color(0xffFE6D51),
      Color(0xff9AFFB1),
      Color(0xffFCE8C3),
      Color(0xffFF8E60),
      Color(0xff8AD0FC),
      Color(0xffF6C383),
    ];

    final randomStrColor = array[Random().nextInt(array.length - 1)];
    return randomStrColor;
  }
}

final ThemeData baseTheme = ThemeData(
  backgroundColor: BaseColors.color1,
  scaffoldBackgroundColor: BaseColors.color1,
  primaryColor: BaseColors.color5,
  accentColor: BaseColors.color2,
  dividerColor: DnbColors.grey.withOpacity(0.6),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: BaseColors.color10,
      fontWeight: FontWeight.w300,
    ),
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
  ),
  textTheme: TextTheme(
    button: TextStyle(
      fontSize: 23,
      color: BaseColors.color10,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.65,
    ),
    bodyText2: TextStyle(
      fontSize: 12,
      color: BaseColors.color10,
    ),
    bodyText1: TextStyle(
      fontSize: 14,
      color: BaseColors.color10,
    ),
    subtitle2: TextStyle(
      fontSize: 16,
      color: BaseColors.color10,
    ),
    subtitle1: TextStyle(
      fontSize: 18,
      color: BaseColors.color10,
    ),
    headline6: TextStyle(
      fontSize: 22,
      color: BaseColors.color10,
    ),
    headline5: TextStyle(
      fontSize: 24,
      color: BaseColors.color10,
    ),
    headline4: TextStyle(
      fontSize: 27,
      color: BaseColors.color10,
    ),
    headline3: TextStyle(
      fontSize: 38,
      color: BaseColors.color10,
    ),
    headline1: TextStyle(
      fontSize: 43,
      color: BaseColors.color10,
      fontWeight: FontWeight.normal,
    ),
  ),
  iconTheme: IconThemeData(color: BaseColors.color10),
  unselectedWidgetColor: BaseColors.color10,
  cursorColor: BaseColors.color10,
  fontFamily: 'AirbnbCereal',
  cardTheme: CardTheme(
    margin: const EdgeInsets.all(10),
    color: DnbColors.secondaryBlack,
    elevation: 0,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.transparent,
    iconTheme: IconThemeData(color: BaseColors.color10),
  ),
);
