import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Theme/ThemeData.dart';
import 'package:vms_school/main.dart';

class Themecontroller extends GetxController {
  static bool get isDarkMode => prefs!.getBool("mode") ?? true;
  static set isDarkMode(bool v) => prefs!.setBool("mode", v);
  static ThemeMode get defualtTheme {
    final data = prefs!.getBool("mode");
    if (data == null) {
      return ThemeMode.light;
    }
    if (data == true) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }
}
