import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/services/services.dart';
import '../classes/appTheme.dart';

class LangController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();


  ThemeData appTheme = themeEnglish ;

  changeLang(String languageCode) {
    Locale locale = Locale(languageCode);
    myServices.sharedPreferences.setString("lang", languageCode);
    appTheme = languageCode == "ar" ? themeArabic : themeEnglish ;
    Get.changeTheme(appTheme) ;
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharePrefLang = myServices.sharedPreferences.getString("lang");
    if (sharePrefLang == "ar") {
      language = changeLang("ar");
      appTheme = themeArabic ;
    } else if (sharePrefLang == "en") {
      language = changeLang("en");
      appTheme = themeEnglish ;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish ;
    }
    super.onInit();
  }
}
