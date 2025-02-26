import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class theme {
  static ThemeData Light_Theme = ThemeData(
    
    cardColor: const Color(0xffFBFBFB),
    primaryColorLight: const Color(0xff19478d), // card button
    primaryColor: const Color(0xff19478d),
    scaffoldBackgroundColor: Colors.white,
    indicatorColor: Color(0xffD4DFE5),
    dialogBackgroundColor: Colors.white,
    secondaryHeaderColor: Colors.black,
    highlightColor: const Color(0xff19478d),
    canvasColor: const Color(0xff134B70),
    disabledColor: Color(0xffB03D3D),
    textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 26, color: Colors.black),
        bodyMedium:
            TextStyle(color: Colors.black, fontFamily: "Cairo", fontSize: 14),
        titleLarge: TextStyle(
            color: Color(0xff134B70), fontFamily: "Cairo", fontSize: 14),
        titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff134B70),
            fontFamily: "Cairo",
            fontSize: 24),
        headlineLarge: TextStyle(
          //table head
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        displayMedium:
            TextStyle(color: Colors.white, fontFamily: "Cairo", fontSize: 14)),
    fontFamily: "Cairo",
    focusColor: Colors.white,
    colorScheme: const ColorScheme.light(
        primary: Color(0xff19478d),
        onPrimary: Color(0xffEAF0FF),
        secondary: Color(0xff7c9fb9)),
    popupMenuTheme: const PopupMenuThemeData(
        color: Colors.white,
        labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.black))),
    checkboxTheme: const CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(Colors.white),
    ),
    datePickerTheme: const DatePickerThemeData(
      surfaceTintColor: Colors.white,

      dayOverlayColor: WidgetStatePropertyAll(Color(0xff19478d)),
      // todayBackgroundColor: WidgetStatePropertyAll(Color(0xff19478d))
    ),
  );

  static ThemeData Dark_Theme = ThemeData(
    primaryColorLight: const Color.fromARGB(255, 29, 28, 28),
    cardColor: const Color(0xff464646),
    highlightColor: Colors.white,
    indicatorColor: Color.fromARGB(255, 57, 60, 61),
    popupMenuTheme: const PopupMenuThemeData(
        color: Color(0xff464646),
        labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white))),
    scaffoldBackgroundColor: const Color(0xff1A1A1B),
    canvasColor: const Color(0xff252525),
    focusColor: const Color(0xff1A1A1B),
    secondaryHeaderColor: Colors.white,
    disabledColor: Color.fromARGB(255, 238, 141, 141),
    textTheme: const TextTheme(
        bodyMedium:
            TextStyle(color: Colors.white, fontFamily: "Cairo", fontSize: 14),
        displayMedium:
            TextStyle(color: Colors.white, fontFamily: "Cairo", fontSize: 14),
        titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: "Cairo",
            fontSize: 24),
        headlineLarge: TextStyle(
          //table head
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        displayLarge: TextStyle(fontSize: 26, color: Colors.white),
        titleLarge: TextStyle(
            color: Colors.blueGrey, fontFamily: "Cairo", fontSize: 14)),
    fontFamily: "Cairo",
    dialogBackgroundColor: Colors.white.withOpacity(0.3),
    primaryColor: const Color(0xff464646),
    useMaterial3: true,
    cupertinoOverrideTheme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyle(color: Colors.white),
            pickerTextStyle: TextStyle(color: Colors.white, fontSize: 16))),
    colorScheme: const ColorScheme.dark(
        primary: Color(0xff19478d),
        onPrimary: Color(0xff464646),
        secondary: Color(0xff252323)),
    checkboxTheme: const CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(Colors.white),
    ),
    datePickerTheme: const DatePickerThemeData(
      surfaceTintColor: Colors.white,
      dayOverlayColor: WidgetStatePropertyAll(Color(0xff464646)),
      todayBackgroundColor: WidgetStatePropertyAll(
        Color(0xff464646),
      ),
      todayForegroundColor: WidgetStatePropertyAll(Colors.white),
      dayForegroundColor: WidgetStatePropertyAll(Colors.white),
      cancelButtonStyle:
          ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.white)),
      confirmButtonStyle:
          ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.white)),
    ),
  );
}
