import 'dart:math';

import 'package:flutter/material.dart';

class BaseColors {
  static Color accent1 = Color(0xff4550A1); //  ##4550A1
  static Color accent2 = Color(0xff332C5E); //  ###332C5E
  static Color background = Color(0xff1C1C1F); //  ##1C1C1F
  static Color text = Color(0xffABADAE); //  ##ABADAE

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
  backgroundColor: BaseColors.background,
  scaffoldBackgroundColor: BaseColors.background,
  primaryColor: BaseColors.accent1,
  accentColor: BaseColors.accent2,
  dividerColor: Colors.grey.withOpacity(0.6),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: BaseColors.text,
      fontWeight: FontWeight.w300,
    ),
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
  ),
  textTheme: TextTheme(
    button: TextStyle(
      fontSize: 23,
      color: BaseColors.text,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.65,
    ),
    bodyText2: TextStyle(
      fontSize: 12,
      color: BaseColors.text,
    ),
    bodyText1: TextStyle(
      fontSize: 14,
      color: BaseColors.text,
    ),
    subtitle2: TextStyle(
      fontSize: 16,
      color: BaseColors.text,
    ),
    subtitle1: TextStyle(
      fontSize: 18,
      color: BaseColors.text,
    ),
    headline6: TextStyle(
      fontSize: 22,
      color: BaseColors.text,
    ),
    headline5: TextStyle(
      fontSize: 24,
      color: BaseColors.text,
    ),
    headline4: TextStyle(
      fontSize: 27,
      color: BaseColors.text,
    ),
    headline3: TextStyle(
      fontSize: 38,
      color: BaseColors.text,
    ),
    headline1: TextStyle(
      fontSize: 43,
      color: BaseColors.text,
      fontWeight: FontWeight.normal,
    ),
  ),
  iconTheme: IconThemeData(color: BaseColors.text),
  unselectedWidgetColor: BaseColors.text,
  cursorColor: BaseColors.text,
  fontFamily: 'AirbnbCereal',
  cardColor: BaseColors.background,
  cardTheme: CardTheme(
    margin: const EdgeInsets.all(10),
    color: BaseColors.background,
    elevation: 0,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: BaseColors.accent1,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.transparent,
    iconTheme: IconThemeData(color: BaseColors.text),
  ),
);
