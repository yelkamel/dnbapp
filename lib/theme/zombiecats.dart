import 'dart:math';

import 'package:flutter/material.dart';

class ZombieCatsColors {
  static Color accent1 = Color(0xffaaa7a7); //  ##aaa7a7
  static Color accent2 = Colors.black54; //  ###0000
  static Color background = Colors.white; //  ##ffff
  static Color text = Colors.black; //  ##0000
  static Color icon = Color(0xffe8e8e8); //  ##e8e8e8

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

final ThemeData zombieCatsTheme = ThemeData(
  backgroundColor: ZombieCatsColors.background,
  scaffoldBackgroundColor: ZombieCatsColors.background,
  primaryColor: ZombieCatsColors.accent1,
  accentColor: ZombieCatsColors.accent2,
  dividerColor: Colors.grey.withOpacity(0.6),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: ZombieCatsColors.text,
      fontWeight: FontWeight.w300,
    ),
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
  ),
  textTheme: TextTheme(
    button: TextStyle(
      fontSize: 23,
      color: ZombieCatsColors.text,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.65,
    ),
    bodyText2: TextStyle(
      fontSize: 12,
      color: ZombieCatsColors.text,
    ),
    bodyText1: TextStyle(
      fontSize: 14,
      color: ZombieCatsColors.text,
    ),
    subtitle2: TextStyle(
      fontSize: 16,
      color: ZombieCatsColors.text,
    ),
    subtitle1: TextStyle(
      fontSize: 18,
      color: ZombieCatsColors.text,
    ),
    headline6: TextStyle(
      fontSize: 22,
      color: ZombieCatsColors.text,
    ),
    headline5: TextStyle(
      fontSize: 24,
      color: ZombieCatsColors.text,
    ),
    headline4: TextStyle(
      fontSize: 27,
      color: ZombieCatsColors.text,
    ),
    headline3: TextStyle(
      fontSize: 38,
      color: ZombieCatsColors.text,
    ),
    headline1: TextStyle(
      fontSize: 43,
      color: ZombieCatsColors.text,
      fontWeight: FontWeight.normal,
    ),
  ),
  iconTheme: IconThemeData(color: ZombieCatsColors.icon),
  unselectedWidgetColor: ZombieCatsColors.text,
  cursorColor: ZombieCatsColors.text,
  fontFamily: 'AirbnbCereal',
  cardColor: ZombieCatsColors.background,
  cardTheme: CardTheme(
    margin: const EdgeInsets.all(10),
    color: ZombieCatsColors.background,
    elevation: 0,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: ZombieCatsColors.accent1,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.transparent,
    iconTheme: IconThemeData(color: ZombieCatsColors.text),
  ),
);
