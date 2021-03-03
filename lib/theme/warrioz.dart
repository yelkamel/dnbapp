import 'dart:math';

import 'package:flutter/material.dart';

class WarriorzColors {
  static Color accent1 = Color(0xffa23bdd); //  ##a23bdd
  static Color accent2 = Color(0xff421c59); //  ###421c59
  static Color background = Color(0xff0000); //  ##0000
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

final ThemeData warriorzTheme = ThemeData(
  backgroundColor: WarriorzColors.background,
  scaffoldBackgroundColor: WarriorzColors.background,
  primaryColor: WarriorzColors.accent1,
  accentColor: WarriorzColors.accent2,
  dividerColor: Colors.grey.withOpacity(0.6),
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: WarriorzColors.text,
      fontWeight: FontWeight.w300,
    ),
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
  ),
  textTheme: TextTheme(
    button: TextStyle(
      fontSize: 23,
      color: WarriorzColors.text,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.65,
    ),
    bodyText2: TextStyle(
      fontSize: 12,
      color: WarriorzColors.text,
    ),
    bodyText1: TextStyle(
      fontSize: 14,
      color: WarriorzColors.text,
    ),
    subtitle2: TextStyle(
      fontSize: 16,
      color: WarriorzColors.text,
    ),
    subtitle1: TextStyle(
      fontSize: 18,
      color: WarriorzColors.text,
    ),
    headline6: TextStyle(
      fontSize: 22,
      color: WarriorzColors.text,
    ),
    headline5: TextStyle(
      fontSize: 24,
      color: WarriorzColors.text,
    ),
    headline4: TextStyle(
      fontSize: 27,
      color: WarriorzColors.text,
    ),
    headline3: TextStyle(
      fontSize: 38,
      color: WarriorzColors.text,
    ),
    headline1: TextStyle(
      fontSize: 43,
      color: WarriorzColors.text,
      fontWeight: FontWeight.normal,
    ),
  ),
  iconTheme: IconThemeData(color: WarriorzColors.text),
  unselectedWidgetColor: WarriorzColors.text,
  cursorColor: WarriorzColors.text,
  fontFamily: 'AirbnbCereal',
  cardColor: WarriorzColors.background,
  cardTheme: CardTheme(
    margin: const EdgeInsets.all(10),
    color: WarriorzColors.background,
    elevation: 0,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: WarriorzColors.accent1,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.transparent,
    iconTheme: IconThemeData(color: WarriorzColors.text),
  ),
);
