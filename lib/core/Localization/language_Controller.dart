import 'package:delivery/core/Functions/FCMConfingration_Functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/core/Constant/AppTheme_Const.dart';
import 'package:delivery/core/Services/Services.dart';
import 'package:geolocator/geolocator.dart';

class LanguageController extends GetxController {
  MyServices myServices = Get.find();
  Locale? language;
  ThemeData apptheme = Themes.themeEnglish;
  changeLang(String codelang) {
    Locale locale = Locale(codelang);
    ThemeData theme =
        codelang == "ar" ? Themes.themeArabic : Themes.themeEnglish;
    myServices.sharedPreferences.setString("lang", codelang);
    Get.updateLocale(locale);
    Get.changeTheme(theme);
  }

  requestLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("notice", "Open Location Services");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar(
            "notice", "you should give permission to this app ");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar(
          "notice", "You can't use this app without location permission");
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void onInit() {
    requestLocationPermission();
    requestPermissoinNotifivation();
    fcmConFing();
    String? sharedpreflang = myServices.sharedPreferences.getString("lang");
    if (sharedpreflang == "ar") {
      language = const Locale("ar");
      apptheme = Themes.themeArabic;
    } else if (sharedpreflang == "en") {
      language = const Locale("en");
      apptheme = Themes.themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      apptheme = Themes.themeEnglish;
    }
    super.onInit();
  }
}
