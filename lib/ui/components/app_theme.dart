import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  final primaryColor = Color(0xffaa27f5);
  final primaryColorDark = Color(0xff8109c6);
  final primaryColorLight = Color(0xffd493fa);

  final disabledColor = Colors.grey[400];
  final dividerColor = Colors.grey;

  final textTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: primaryColorDark,
      fontFamily: 'Nunito',
    ),
    headline2: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Nunito',
    ),
    headline3: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        letterSpacing: 10),
    bodyText2:
        TextStyle(fontSize: 18, fontFamily: 'Nunito', color: primaryColorDark),
  );

  final inputDecorationTheme = InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primaryColorLight),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
    ),
    alignLabelWithHint: true,
    labelStyle: TextStyle(
      color: primaryColorDark,
      fontSize: 20,
    ),
  );

  final elevatedbuttonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
      backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: primaryColorLight,
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );

  return ThemeData(
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      disabledColor: disabledColor,
      dividerColor: dividerColor,
      accentColor: primaryColor,
      backgroundColor: Colors.white,
      textTheme: textTheme,
      inputDecorationTheme: inputDecorationTheme,
      elevatedButtonTheme: elevatedbuttonTheme);
}
