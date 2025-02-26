import 'package:flutter/material.dart';  
import 'package:get/get.dart';  
import 'package:shared_preferences/shared_preferences.dart';  
 const String languageKey = 'selected_language';
class LocalizationController extends GetxController {  

  var currentLocale = const Locale('ar').obs;  

  @override  
  void onInit() {  
    super.onInit();  
    loadLanguageFromCache();  
  }  

  Future<void> loadLanguageFromCache() async {  
    final prefs = await SharedPreferences.getInstance();  
    String? savedLanguageCode = prefs.getString(languageKey);  

    if (savedLanguageCode != null) {  
      currentLocale.value = Locale(savedLanguageCode);  
      Get.updateLocale(currentLocale.value);  
    }  
  }  

  Future<void> changeLanguage(Locale locale) async {  
    final prefs = await SharedPreferences.getInstance();  
    await prefs.setString(languageKey, locale.languageCode);  

    currentLocale.value = locale;  
    Get.updateLocale(locale);  
  }  
}