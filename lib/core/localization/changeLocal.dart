import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:kiwi/core/services/services.dart';
import '../classes/appTheme.dart';
import '../constants/colors.dart';

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

  requestPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.defaultDialog(
          title: "Alert!",
          middleText: "Location services are disabled. Please turn on the location service.",
          actions: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("I get it")),
          ]
          );
  }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      return Get.defaultDialog(
        title: "Alert!",
        middleText: "Location services are disabled. Please turn on the location service.",
          actions: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("I get it")),
          ]
      );
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.defaultDialog(
        title: "Alert!",
        middleText: "You cannot use the application because location permissions are permanently denied.",
          actions: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("I get it")),
          ]
      );
    }
  }

  @override
  void onInit() {
    requestPermissionLocation();
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
